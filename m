Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98976C433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 23:56:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6555322597
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 23:56:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732053AbhAYXzk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Jan 2021 18:55:40 -0500
Received: from mga05.intel.com ([192.55.52.43]:27042 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731325AbhAYTpX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Jan 2021 14:45:23 -0500
IronPort-SDR: koou2FsmJsMTFcvAYz0nLud1DU4gri5Ad0RBrFXYyP31O5BSdzGo7/ZHIHDeXccj/0I5tCwpF7
 ue0egPpqdQhw==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="264610617"
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; 
   d="scan'208";a="264610617"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 11:43:25 -0800
IronPort-SDR: eojOeARrVb9ict9S0VlQQYP2csDggxMTZoIgrsyowZAB77SHg/ySQjxi2jSQ/Uvm2UzWWG64o/
 mVC8m+JYJ8Yg==
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; 
   d="scan'208";a="472466421"
Received: from smtp.ostc.intel.com ([10.54.29.231])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 11:43:24 -0800
Received: from localhost (mtg-dev.jf.intel.com [10.54.74.10])
        by smtp.ostc.intel.com (Postfix) with ESMTP id ABD7C6365;
        Mon, 25 Jan 2021 11:43:24 -0800 (PST)
Date:   Mon, 25 Jan 2021 11:43:24 -0800
From:   mark gross <mgross@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     mgross@linux.intel.com, Andy Shevchenko <andy@infradead.org>,
        Elia Devito <eliadevito@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens@rwth-aachen.de>
Subject: Re: [PATCH] platform/x86: hp-wmi: Disable tablet-mode reporting by
 default
Message-ID: <20210125194324.GA5486@linux.intel.com>
Reply-To: mgross@linux.intel.com
References: <20210120124941.73409-1-hdegoede@redhat.com>
 <20210121234803.GB60912@linux.intel.com>
 <2a964e64-866e-b2aa-702b-e33c80fd046d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a964e64-866e-b2aa-702b-e33c80fd046d@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Jan 22, 2021 at 01:15:05AM +0100, Hans de Goede wrote:
> Hi,
> 
> On 1/22/21 12:48 AM, mark gross wrote:
> > On Wed, Jan 20, 2021 at 01:49:41PM +0100, Hans de Goede wrote:
> >> Recently userspace has started making more use of SW_TABLET_MODE
> >> (when an input-dev reports this).
> >>
> >> Specifically recent GNOME3 versions will:
> >>
> >> 1.  When SW_TABLET_MODE is reported and is reporting 0:
> >> 1.1 Disable accelerometer-based screen auto-rotation
> >> 1.2 Disable automatically showing the on-screen keyboard when a
> >>     text-input field is focussed
> >>
> >> 2.  When SW_TABLET_MODE is reported and is reporting 1:
> >> 2.1 Ignore input-events from the builtin keyboard and touchpad
> >>     (this is for 360° hinges style 2-in-1s where the keyboard and
> >>      touchpads are accessible on the back of the tablet when folded
> >>      into tablet-mode)
> >>
> >> This means that claiming to support SW_TABLET_MODE when it does not
> >> actually work / reports correct values has bad side-effects.
> > did you mean "reports incorrect values"?
> 
> Yes and no, I meant this to be read as "does not (...) report correct values"
> but your suggestion is better I will fix this for v2.
> 
> > 
> >>
> >> The check in the hp-wmi code which is used to decide if the input-dev
> >> should claim SW_TABLET_MODE support, only checks if the
> >> HPWMI_HARDWARE_QUERY is supported. It does *not* check if the hardware
> >> actually is capable of reporting SW_TABLET_MODE.
> >>
> >> This leads to the hp-wmi input-dev claming SW_TABLET_MODE support,
> >> while in reality it will always report 0 as SW_TABLET_MODE value.
> >> This has been seen on a "HP ENVY x360 Convertible 15-cp0xxx" and
> >> this likely is the case on a whole lot of other HP models.
> >>
> >> This problem causes both auto-rotation and on-screen keyboard
> >> support to not work on affected x360 models.
> >>
> >> There is no easy fix for this, but since userspace expects
> >> SW_TABLET_MODE reporting to be reliable when advertised it is
> >> better to not claim/report SW_TABLET_MODE support at all, then
> >                                                             than
> >> to claim to support it while it does not work.
> >>
> >> To avoid the mentioned problems, add a new enable_tablet_mode_sw
> >> module-parameter which defaults to false.
> >>
> >> Note I've made this an int using the standard -1=auto, 0=off, 1=on
> >> tripplet, with the hope that in the future we can come up with a
> >> better way to detect SW_TABLET_MODE support. ATM the default
> >> auto option just does the same as off.
> >>
> >> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1918255
> >> Cc: Stefan Brüns <stefan.bruens@rwth-aachen.de>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  drivers/platform/x86/hp-wmi.c | 14 ++++++++++----
> >>  1 file changed, 10 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> >> index 18bf8aeb5f87..ff028587cd21 100644
> >> --- a/drivers/platform/x86/hp-wmi.c
> >> +++ b/drivers/platform/x86/hp-wmi.c
> >> @@ -32,6 +32,10 @@ MODULE_LICENSE("GPL");
> >>  MODULE_ALIAS("wmi:95F24279-4D7B-4334-9387-ACCDC67EF61C");
> >>  MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
> >>  
> >> +static int enable_tablet_mode_sw = -1;
> > So busted HW gets the default while working HW will need to add a boot time
> > parameter.  If there are no working tablet_mode devices I guess its ok but, if
> > I had a working platform I'd be a little miffed at the choice to make my life
> > harder (by forcing me to add a enable_tablet_mode_sw=1 to my kernel
> > command line) while making life easier for those with busted hardware.
> > 
> > I'm not saying change it but, it should be considered.
> 
> Until recently userspace pretty much ignored SW_TABLET_MODE, so reporting
> it while it did not work was not a big deal, but as I tried to explain
> in the commit message always reporting SW_TABLET_MODE=0 does cause some
> real issues:
> 
> >> 1.  When SW_TABLET_MODE is reported and is reporting 0:
> >> 1.1 Disable accelerometer-based screen auto-rotation
> >> 1.2 Disable automatically showing the on-screen keyboard when a
> >>     text-input field is focussed
> 
> By defaulting to not reporting SW_TABLET_MODE at all we go back to the
> (slightly) older userspace behavior of always doing auto-rotation and
> always popping up the onscreen-keyboard on text-field focus (on devices
> with a touchscreen).
> 
> So basically the bad side-effects of reporting SW_TABLET_MODE while it
> is not working are much worse then the bad side-effects of not reporting
> it on devices where it does work.
> 
> More in general the way userspace uses SW_TABLET_MODE means that if
> we report it, then it MUST be reliable. If it is not reliable then it
> is better to not support it at all.
Yeah, thats all too true as well.  Making user mode work correctly takes
priority over my sense of fairness.

Acked-by: Mark Gross <mgross@linux.intel.com>


--mark

> 
> For this reason the intel-vbtn, intel-hid and asus-wmi driver have all
> 3 already been moved over to using a DMI based whitelist. And now I
> guess it is hp-wmi's turn to follow in their footsteps.
> 
> Ideally there is some WMI query other then the HPWMI_HARDWARE_QUERY
> which actually tells us which bits in the HPWMI_HARDWARE_QUERY result
> are valid and which bits are simply always 0.  I hope someone who
> actually has this hardware can spend some time figuring this out.
> 
> In the mean time disabling SW_TABLET_MODE reporting is the safe
> fallback option; and if people come forward where this does work
> then we can do a DMI based whitelist (*).
> 
> Regards,
> 
> Hans
> 
> *) Which will hopefully be a temporary solution but there is absolutely 
> no documentation for all this crap and most vendors don't seem to care
> about helping us with this, so...
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> > 
> > --mark
> > 
> > 
> >> +module_param(enable_tablet_mode_sw, int, 0444);
> >> +MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TABLET_MODE reporting (-1=auto, 0=no, 1=yes)");
> >> +
> >>  #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
> >>  #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
> >>  
> >> @@ -654,10 +658,12 @@ static int __init hp_wmi_input_setup(void)
> >>  	}
> >>  
> >>  	/* Tablet mode */
> >> -	val = hp_wmi_hw_state(HPWMI_TABLET_MASK);
> >> -	if (!(val < 0)) {
> >> -		__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
> >> -		input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, val);
> >> +	if (enable_tablet_mode_sw > 0) {
> >> +		val = hp_wmi_hw_state(HPWMI_TABLET_MASK);
> >> +		if (!(val < 0)) {
> >> +			__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
> >> +			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, val);
> >> +		}
> >>  	}
> >>  
> >>  	err = sparse_keymap_setup(hp_wmi_input_dev, hp_wmi_keymap, NULL);
> >> -- 
> >> 2.28.0
> >>
> > 
> 
