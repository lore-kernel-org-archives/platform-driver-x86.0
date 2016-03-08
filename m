From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 2/2] hp-wmi: remove GPS rfkill support via pre-2009
 interface
Date: Tue, 8 Mar 2016 05:11:31 -0800
Message-ID: <20160308131131.GD31742@dvhart-mobl5.amr.corp.intel.com>
References: <56DCB1D3.9070403@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:60979 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750843AbcCHNLg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Mar 2016 08:11:36 -0500
Content-Disposition: inline
In-Reply-To: <56DCB1D3.9070403@maciej.szmigiero.name>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, =?iso-8859-1?Q?Trep=E1k?= Vilmos <trepo@netcomga.sk>

On Sun, Mar 06, 2016 at 11:40:19PM +0100, Maciej S. Szmigiero wrote:
> GPS rfkill support via pre-2009 WMI interface uses
> hp_wmi_get_sw_state() and hp_wmi_get_hw_state()
> to query its current hard and soft block state,
> respectively.
> 
> In hp_wmi_get_sw_state() a mask is calculated which
> bit should be checked in an int value returned by
> firmware to get current block state:
> 0x200 << (r * 8) which with r being 3 for GPS
> results in overflow and mask of zero.
> The same goes for hp_wmi_get_hw_state().
> 
> This effectively means that GPS rfkill on this
> WMI interface is considered always both hard and
> soft blocked.
> 
> Unfortunately, later when rfkill subsystem calls
> hp_wmi_set_block() to sync this block to hardware
> firmware at least on my old nc6400 gets confused
> and sets both hard and soft blocks on WiFi and BT.
> 
> This happens for example on hp-wmi module load.
> 
> Since due to overflow described above it is dubious that
> this ever worked correctly and HP laptops with modems
> having GPS support seem to all have been released well past
> year 2009 let's just remove GPS rfkill support via
> pre-2009 WMI interface.
> 

This looks reasonable. As it fails to apply without patch 1/2, please resubmit
along with my feedback for 1/2.

Also, please update your line wrap to 75 characters for commit messages.
(see Documentation/SubmittingPatches "14) The canonical patch format").

Thanks,
-- 
Darren Hart
Intel Open Source Technology Center
