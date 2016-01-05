From: Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@linux-vserver.org>
Subject: Re: [PATCH 1/1] apple-gmux: Add initial documentation
Date: Tue, 5 Jan 2016 09:19:55 +0100
Message-ID: <20160105091955.28b6b649@pluto.restena.lu>
References: <cover.1451909346.git.lukas@wunner.de>
	<a31335edd1ac55792220b8af898f7b3a4d314c75.1451909346.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtprelay.restena.lu ([158.64.1.62]:52457 "EHLO
	smtprelay.restena.lu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751221AbcAEI32 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 Jan 2016 03:29:28 -0500
In-Reply-To: <a31335edd1ac55792220b8af898f7b3a4d314c75.1451909346.git.lukas@wunner.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Seth Forshee <seth.forshee@canonical.com>, Andreas Heider <andreas@meetr.de>, Matthew Garrett <mjg59@srcf.ucam.org>, Bernhard Froemel <froemel@vmars.tuwien.ac.at>, Bruno Bierbaumer <bruno@bierbaumer.net>, William Brown <william@blackhats.net.au>, Pierre Moreau <pierre.morrow@free.fr>

On Mon, 4 Jan 2016 17:52:06 +0100 Lukas Wunner wrote:
> Document what I've learned so far about the gmux so that we can
> collaboratively reverse-engineer its remaining unknown bits
> without everyone having to start from scratch.
> 
> The DOC sections are bound together in the gpu.tmpl DocBook
> under a new vga_switcheroo "Handlers" chapter. Eventually
> this should be amended with documentation about the four other
> handlers that exist so far (nouveau v1 DSM, nouveau Optimus DSM,
> radeon ATPX, amdgpu ATPX).
> 
> Requires kernel-doc with asciidoc support.
> 
> The EFI variable was reverse-engineered by Bruno Bierbaumer
> <bruno@bierbaumer.net> and Andreas Heider <andreas@meetr.de>.
> 
> Some of the remaining open questions:
> 
> * How are vblank intervals synchronized on retinas to achieve seamless
>   switching? Is the DP mux capable of this? It's not mentioned in the
>   data sheets. Or is it done at the OS level, i.e. do we have to
>   synchronize vblank intervals between DRM drivers? There's a signal
>   coming from the panel connector and going into gmux, could this be
>   the vblank signal as received by the panel to properly time the
>   switch?
> 
> * On retinas there's an I2C bus between gmux and the connector of the
>   right I/O board, apparently leading to the Parade PS8401A HDMI
>   repeater. What is this for, is it controlled via gmux registers?
>   Data sheet:
>   http://www.paradetech.com/products/jitter-cleaning-repeaters/ps8401/
> 
> * On retinas there's an I2C bus between gmux and the LED driver.
>   Pre-retinas connected the LED driver to SMBUS. Are there additional
>   gmux registers on retinas to control it?
> 
> * The MacPro6,1 2013 also has a gmux, the same Renesas R4F2113 as the
>   retina MacBook Pro. The Mac Pro doesn't have a built-in display,
>   so what is its purpose? Power control of the dual FirePro GPUs?
>   Switching of the external DP/Thunderbolt ports? The iFixit teardown
>   clearly shows one TI HD3SS212 DisplayPort mux on the logic board next
>   to one of the three Thunderbolt controllers. However six muxes would
>   be necessary to switch all six ports between GPUs. The mux is probably
>   necessary for one of the display configurations allowed by Apple,
>   but which one?
>   https://www.ifixit.com/Teardown/Mac+Pro+Late+2013+Teardown/20778
>   https://d3nevzfk7ii3be.cloudfront.net/igi/fELBTnt31QhnDsqq.huge
>   https://support.apple.com/en-us/HT202801
> 
> * Registers we haven't decoded yet:
>   0x700 32 Bit configmap?
>   0x708 32 Bit power sequence?
>   0x712  8 Bit status of clock from panel on retinas?
>   0x713  8 Bit dito?
>   0x724 16 Bit backlight, raw value?
>   0x760 32 Bit backlight
>   0x764 32 Bit backlight
>   0x768  8 Bit backlight
>   0x76a 16 Bit backlight
>   0x76c 16 Bit backlight
>   0x76e 16 Bit backlight
>   0x77f        edp/dp/hdmi probe? retina only.

Missing is also precise knowledge as to what the gmux depends on.
From behavioral reports, it is somehow sensitive to VGA IO/MEM
routing (it apparently needs the routing to go to integrated GPU,
not discrete GPU).
When the routing is inappropriate backlight control IO just reads back
as 0xFF (and eventually gmux IO in general does so)


Bruno



> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  Documentation/DocBook/gpu.tmpl    |  22 ++++++++
>  drivers/platform/x86/apple-gmux.c | 113 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 135 insertions(+)
> 
> diff --git a/Documentation/DocBook/gpu.tmpl b/Documentation/DocBook/gpu.tmpl
> index 225a246..9e95aa1 100644
> --- a/Documentation/DocBook/gpu.tmpl
> +++ b/Documentation/DocBook/gpu.tmpl
> @@ -3658,8 +3658,30 @@ int num_ioctls;</synopsis>
>      </sect1>
>    </chapter>
>  
> +  <chapter id="handlers">
> +    <title>Handlers</title>
> +    <sect1>
> +      <title>apple-gmux Handler</title>
> +!Pdrivers/platform/x86/apple-gmux.c Overview
> +!Pdrivers/platform/x86/apple-gmux.c Interrupt
> +      <sect2>
> +        <title>Graphics mux</title>
> +!Pdrivers/platform/x86/apple-gmux.c Graphics mux
> +      </sect2>
> +      <sect2>
> +        <title>Power control</title>
> +!Pdrivers/platform/x86/apple-gmux.c Power control
> +      </sect2>
> +      <sect2>
> +        <title>Backlight control</title>
> +!Pdrivers/platform/x86/apple-gmux.c Backlight control
> +      </sect2>
> +    </sect1>
> +  </chapter>
> +
>  !Cdrivers/gpu/vga/vga_switcheroo.c
>  !Cinclude/linux/vga_switcheroo.h
> +!Cdrivers/platform/x86/apple-gmux.c
>  </part>
>  
>  </book>
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> index aa58d41..f236250 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -3,6 +3,7 @@
>   *
>   *  Copyright (C) Canonical Ltd. <seth.forshee@canonical.com>
>   *  Copyright (C) 2010-2012 Andreas Heider <andreas@meetr.de>
> + *  Copyright (C) 2015 Lukas Wunner <lukas@wunner.de>
>   *
>   *  This program is free software; you can redistribute it and/or modify
>   *  it under the terms of the GNU General Public License version 2 as
> @@ -26,6 +27,24 @@
>  #include <acpi/video.h>
>  #include <asm/io.h>
>  
> +/**
> + * DOC: Overview
> + *
> + * :1:  http://www.latticesemi.com/en/Products/FPGAandCPLD/LatticeXP2.aspx
> + * :2:  http://www.renesas.com/products/mpumcu/h8s/h8s2100/h8s2113/index.jsp
> + *
> + * gmux is a microcontroller built into the MacBook Pro to support dual GPUs:
> + * A {1}[Lattice XP2] on pre-retinas, a {2}[Renesas R4F2113] on retinas.
> + *
> + * (The MacPro6,1 2013 also has a gmux, however it is unclear why since it has
> + * dual GPUs but no built-in display.)
> + *
> + * gmux is connected to the LPC bus of the southbridge. Its I/O ports are
> + * accessed differently depending on the microcontroller: Driver functions
> + * to access a pre-retina gmux are infixed `_pio_`, those for a retina gmux
> + * are infixed `_index_`.
> + */
> +
>  struct apple_gmux_data {
>  	unsigned long iostart;
>  	unsigned long iolen;
> @@ -247,6 +266,20 @@ static bool gmux_is_indexed(struct apple_gmux_data *gmux_data)
>  	return false;
>  }
>  
> +/**
> + * DOC: Backlight control
> + *
> + * :3:  http://www.ti.com/lit/ds/symlink/lp8543.pdf
> + * :4:  http://www.ti.com/lit/ds/symlink/lp8545.pdf
> + *
> + * On single GPU MacBooks, the PWM signal for the backlight is generated by
> + * the GPU. On dual GPU MacBook Pros by contrast, either GPU may be suspended
> + * to conserve energy. Hence the PWM signal needs to be generated by a separate
> + * backlight driver which is controlled by gmux. The earliest generation
> + * MBP5 2008/09 uses a {3}[TI LP8543] backlight driver. All newer models
> + * use a {4}[TI LP8545].
> + */
> +
>  static int gmux_get_brightness(struct backlight_device *bd)
>  {
>  	struct apple_gmux_data *gmux_data = bl_get_data(bd);
> @@ -273,6 +306,68 @@ static const struct backlight_ops gmux_bl_ops = {
>  	.update_status = gmux_update_status,
>  };
>  
> +/**
> + * DOC: Graphics mux
> + *
> + * :5:  http://pimg-fpiw.uspto.gov/fdd/07/870/086/0.pdf
> + * :6:  http://www.nxp.com/documents/data_sheet/CBTL06141.pdf
> + * :7:  http://www.ti.com/lit/ds/symlink/hd3ss212.pdf
> + * :8:  https://www.pericom.com/assets/Datasheets/PI3VDP12412.pdf
> + * :9:  http://www.ti.com/lit/ds/symlink/sn74lv4066a.pdf
> + * :10: http://pdf.datasheetarchive.com/indexerfiles/Datasheets-SW16/DSASW00308511.pdf
> + * :11: http://www.ti.com/lit/ds/symlink/ts3ds10224.pdf
> + *
> + * On pre-retinas, the LVDS outputs of both GPUs feed into gmux which muxes
> + * either of them to the panel. One of the tricks gmux has up its sleeve is
> + * to lengthen the blanking interval of its output during a switch to
> + * synchronize it with the GPU switched to. This allows for a flicker-free
> + * switch that is imperceptible by the user ({5}[US 8,687,007 B2]).
> + *
> + * On retinas, muxing is no longer done by gmux itself, but by a separate
> + * chip which is controlled by gmux. The chip is triple sourced, it is
> + * either an {6}[NXP CBTL06142], {7}[TI HD3SS212] or {8}[Pericom PI3VDP12412].
> + * The panel is driven with eDP instead of LVDS since the pixel clock
> + * required for retina resolution exceeds LVDS' limits.
> + *
> + * Pre-retinas are able to switch the panel's DDC pins separately.
> + * This is handled by a {9}[TI SN74LV4066A] which is controlled by gmux.
> + * The inactive GPU can thus probe the panel's EDID without switching over
> + * the entire panel. Retinas lack this functionality as the chips used for
> + * eDP muxing are incapable of switching the AUX channel separately (see
> + * the linked data sheets, Pericom would be capable but this is unused).
> + * However the retina panel has the NO_AUX_HANDSHAKE_LINK_TRAINING bit set
> + * in its DPCD, allowing the inactive GPU to skip the AUX handshake and
> + * set up the output with link parameters pre-calibrated by the active GPU.
> + *
> + * The external DP port is only fully switchable on the first two unibody
> + * MacBook Pro generations, MBP5 2008/09 and MBP6 2010. This is done by an
> + * {6}[NXP CBTL06141] which is controlled by gmux. It's the predecessor of the
> + * eDP mux on retinas, the difference being support for 2.7 versus 5.4 Gbit/s.
> + *
> + * The following MacBook Pro generations replaced the external DP port with a
> + * combined DP/Thunderbolt port and lost the ability to switch it between GPUs,
> + * connecting it either to the discrete GPU or the Thunderbolt controller.
> + * Oddly enough, while the full port is no longer switchable, AUX and HPD
> + * are still switchable by way of an {10}[NXP CBTL03062] (on pre-retinas
> + * MBP8 2011 and MBP9 2012) or two {11}[TI TS3DS10224] (on retinas) under the
> + * control of gmux. Since the integrated GPU is missing the main link,
> + * external displays appear to it as phantoms which fail to link-train.
> + *
> + * gmux receives the HPD signal of all display connectors and sends an
> + * interrupt on hotplug. On generations which cannot switch external ports,
> + * the discrete GPU can then be woken to drive the newly connected display.
> + * The ability to switch AUX on these generations could be used to improve
> + * reliability of hotplug detection by having the integrated GPU poll the
> + * ports while the discrete GPU is asleep, but currently we do not make use
> + * of this feature.
> + *
> + * gmux' initial switch state on bootup is user configurable via the EFI
> + * variable `gpu-power-prefs-fa4ce28d-b62f-4c99-9cc3-6815686e30f9` (5th byte,
> + * 1 = IGD, 0 = DIS). Based on this setting, the EFI firmware tells gmux to
> + * switch the panel and the external DP connector and allocates a framebuffer
> + * for the selected GPU.
> + */
> +
>  static int gmux_switchto(enum vga_switcheroo_client_id id)
>  {
>  	if (id == VGA_SWITCHEROO_IGD) {
> @@ -288,6 +383,14 @@ static int gmux_switchto(enum vga_switcheroo_client_id id)
>  	return 0;
>  }
>  
> +/**
> + * DOC: Power control
> + *
> + * gmux is able to cut power to the discrete GPU. It automatically takes care
> + * of the correct sequence to tear down and bring up the power rails for
> + * core voltage, VRAM and PCIe.
> + */
> +
>  static int gmux_set_discrete_state(struct apple_gmux_data *gmux_data,
>  				   enum vga_switcheroo_state state)
>  {
> @@ -352,6 +455,16 @@ static const struct vga_switcheroo_handler gmux_handler = {
>  	.get_client_id = gmux_get_client_id,
>  };
>  
> +/**
> + * DOC: Interrupt
> + *
> + * gmux is also connected to a GPIO pin of the southbridge and thereby is able
> + * to trigger an ACPI GPE. On the MBP5 2008/09 it's GPIO pin 22 of the Nvidia
> + * MCP79, on all following generations it's GPIO pin 6 of the Intel PCH.
> + * The GPE merely signals that an interrupt occurred, the actual type of event
> + * is identified by reading a gmux register.
> + */
> +
>  static inline void gmux_disable_interrupts(struct apple_gmux_data *gmux_data)
>  {
>  	gmux_write8(gmux_data, GMUX_PORT_INTERRUPT_ENABLE,
