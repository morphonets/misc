/*-
 * #%L
 * Fiji distribution of ImageJ for the life sciences.
 * %%
 * Copyright (C) 2010 - 2022 Fiji developers.
 * %%
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public
 * License along with this program.  If not, see
 * <http://www.gnu.org/licenses/gpl-3.0.html>.
 * #L%
 */
package org.morphonets.demos;

import java.util.Arrays;

import org.scijava.command.Command;
import org.scijava.plot.PlotService;
import org.scijava.plot.XYPlot;
import org.scijava.plot.XYSeries;
import org.scijava.plugin.Parameter;
import org.scijava.plugin.Plugin;
import org.scijava.ui.UIService;

import net.imagej.ImageJ;

@Plugin(type = Command.class)
public class PlotDemo implements Command {

	@Parameter
	private UIService uiService;

	@Parameter
	private PlotService plotService;

	public void run() {
		XYPlot plot = plotService.newXYPlot();
		plot.setTitle("XY Plot");
		XYSeries series = plot.addXYSeries();
		series.setLabel("Series 1");
		series.setValues(Arrays.asList(1.0, 2.0, 3.0), Arrays.asList(7.0, 3.0, 9.0));
		uiService.show(plot);
	}

	public static void main(String[] args) {
		final ImageJ ij = new ImageJ();
		ij.ui().showUI();
		ij.command().run(PlotDemo.class, true);

	}

}
