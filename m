Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD12FC4320E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 13:14:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5DB06108E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 13:14:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345256AbhIBNPi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Sep 2021 09:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345339AbhIBNPU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Sep 2021 09:15:20 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A3F1C06122E
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Sep 2021 06:12:58 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id u26-20020a05600c441a00b002f66b2d8603so1408297wmn.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Sep 2021 06:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0KMSvpzu+0e4v3QWZES5e7D5+cZcO3zcbXswE89BxKs=;
        b=XQ8JFzIQuPes+r0ssKZW6ha0cT4kRE7SURbcyl6/GQKFQBx2l2emw92oGyH6yPWVVp
         EE4AHdBkpQ4RyHVJp4ljJEIM+k9D2qknZ4CO32E+Wz+fTQX4k6YHAj8K5v2ay3ypsQvX
         WNY5fJZrMdDzYRkpSMLM/FbffMVOcENkTAa9sDxXoPJK+3TLf/bNoc2RESk5ZqxtK2+i
         5JlgaLFOtA1Rt6yTB1EfOiRNEP0YDosRZthTvfokiSMocypRQpFBIK+A4ETXsZzepQD2
         YOcNh6dC939ZiucNjmSrv2bPRtW9uaO0UVfzjeia2mftIUM187vOj5B5AzTeB3p3W3JF
         AE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0KMSvpzu+0e4v3QWZES5e7D5+cZcO3zcbXswE89BxKs=;
        b=Dtz59cZgoT1mAPm39XDAirNjjtLKQFzdYXmOj95O062NreYZf7XSsgD3XRsiNlErQx
         qQs3ej0Cy8u/PbERSlQ7yGORF4VAJxi0lEpIyMLHy5FqvNDMyZ2XtvsmQni+jxqIWWxR
         Fefn89wmEEL4JMxXwaC9ScAcrRT0Wi0Qw8QoDrUs2zZMXipaNbiWR/0OsTReGYYyC8yA
         /RfT8KUXcvJFhACWHyLj5oTlR56p1jgUPwkq/60F9AkklLI2m9pac8963jZRfl/d1NcW
         sti3XKdhVlTak+io3RTtO46IHs7v3p+pdRJCqM504zU2oo61vRDUTh3MQjQbvnoeL87U
         sq2g==
X-Gm-Message-State: AOAM533bcopFMYRjPaCtv3E4ASQ0C8meDWuIHW6ILN7oOiudlDoFm8+j
        Obpi7DCQyhmG+ujRFPhmiJ0=
X-Google-Smtp-Source: ABdhPJzDCvUZx0jWCPI+igMgpsitziu+vBxxryYjecUPprNbq5mQil6ePEmlcq82kDidzX9Mn2p1eg==
X-Received: by 2002:a7b:c014:: with SMTP id c20mr3094941wmb.81.1630588376933;
        Thu, 02 Sep 2021 06:12:56 -0700 (PDT)
Received: from omen.localdomain ([77.78.198.93])
        by smtp.gmail.com with ESMTPSA id e26sm1890608wrc.6.2021.09.02.06.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 06:12:56 -0700 (PDT)
Date:   Thu, 2 Sep 2021 15:12:52 +0200
From:   Enver Balalic <balalic.enver@gmail.com>
To:     =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     mgross@linux.intel.com, jdelvare@suse.com,
        platform-driver-x86@vger.kernel.org, linux@roeck-us.net,
        hdegoede@redhat.com
Subject: Re: [PATCH v4] platform/x86: hp-wmi: add support for omen laptops
Message-ID: <20210902131252.5qzkqispm532fmed@omen.localdomain>
References: <20210827123105.mlrpsfmpbcfunuqc@omen.localdomain>
 <VFDoTRfsCLfG-Ur2bAXhPrTkSyFQXRt59bCTRHlNYsi9wvaZdzFcUnREgsP54RXJ4Lif_Md2ITa9OzVH4igOl5aPVUZ9D99HBchK2NqdKgU=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VFDoTRfsCLfG-Ur2bAXhPrTkSyFQXRt59bCTRHlNYsi9wvaZdzFcUnREgsP54RXJ4Lif_Md2ITa9OzVH4igOl5aPVUZ9D99HBchK2NqdKgU=@protonmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Sep 01, 2021 at 03:53:47PM +0000, Barnabás Pőcze wrote:
> Hi
> 
> 
> > This patch adds support for HP Omen laptops.
> > It adds support for most things that can be controlled via the
> > Windows Omen Command Center application.
> >
> >  - Fan speed monitoring through hwmon
> >  - Platform Profile support (cool, balanced, performance)
> >  - Max fan speed function toggle
> >
> > Also exposes the existing HDD temperature through hwmon since
> > this driver didn't use hwmon before this patch.
> >
> > This patch has been tested on a 2020 HP Omen 15 (AMD) 15-en0023dx.
> >
> >  - V1
> >    Initial Patch
> >  - V2
> >    Use standard hwmon ABI attributes
> >    Add existing non-standard "hddtemp" to hwmon
> >  - V3
> >    Fix overflow issue in "hp_wmi_get_fan_speed"
> >    Map max fan speed value back to hwmon values on read
> >    Code style fixes
> >    Fix issue with returning values from "hp_wmi_hwmon_read",
> >    the value to return should be written to val and not just
> >    returned from the function
> >  - V4
> >    Use DMI Board names to detect if a device should use the omen
> >    specific thermal profile method.
> >    Select HWMON instead of depending on it.
> >    Code style fixes.
> >    Replace some error codes with more specific/meaningful ones.
> >    Remove the HDD temperature from HWMON since we don't know what
> >    unit it's expressed in.
> >    Handle error from hp_wmi_hwmon_init
> >
> > Signed-off-by: Enver Balalic <balalic.enver@gmail.com>
> > ---
> >  drivers/platform/x86/Kconfig  |   1 +
> >  drivers/platform/x86/hp-wmi.c | 336 ++++++++++++++++++++++++++++++++--
> >  2 files changed, 325 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > index d12db6c316ea..2ab0dcf5b598 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -434,6 +434,7 @@ config HP_WMI
> >  	depends on RFKILL || RFKILL = n
> >  	select INPUT_SPARSEKMAP
> >  	select ACPI_PLATFORM_PROFILE
> > +	select HWMON
> >  	help
> >  	 Say Y here if you want to support WMI-based hotkeys on HP laptops and
> >  	 to read data from WMI such as docking or ambient light sensor state.
> > diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> > index 027a1467d009..44030f513453 100644
> > --- a/drivers/platform/x86/hp-wmi.c
> > +++ b/drivers/platform/x86/hp-wmi.c
> > @@ -22,9 +22,11 @@
> >  #include <linux/input/sparse-keymap.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/platform_profile.h>
> > +#include <linux/hwmon.h>
> >  #include <linux/acpi.h>
> >  #include <linux/rfkill.h>
> >  #include <linux/string.h>
> > +#include <linux/dmi.h>
> >
> >  MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
> >  MODULE_DESCRIPTION("HP laptop WMI hotkeys driver");
> > @@ -39,6 +41,25 @@ MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TABLET_MODE reporting (-1=aut
> >
> >  #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
> >  #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
> > +#define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
> > +
> > +/* DMI board names of devices that should use the omen specific path for
> > + * thermal profiles.
> > + * This was obtained by taking a look in the windows omen command center
> > + * app and parsing a json file that they use to figure out what capabilities
> > + * the device should have.
> > + * A device is considered an omen if the DisplayName in that list contains
> > + * "OMEN", and it can use the thermal profile stuff if the "Feature" array
> > + * contains "PerformanceControl".
> > + */
> > +static const char * const omen_thermal_profile_boards[] = {
> > +	"84DA", "84DB", "84DC", "8574", "8575", "860A", "87B5", "8572", "8573",
> > +	"8600", "8601", "8602", "8605", "8606", "8607", "8746", "8747", "8749",
> > +	"874A", "8603", "8604", "8748", "886B", "886C", "878A", "878B", "878C",
> > +	"88C8", "88CB", "8786", "8787", "8788", "88D1", "88D2", "88F4", "88FD",
> > +	"88F5", "88F6", "88F7", "88FE", "88FF", "8900", "8901", "8902", "8912",
> > +	"8917", "8918", "8949", "894A", "89EB"
> > +};
> >
> >  enum hp_wmi_radio {
> >  	HPWMI_WIFI	= 0x0,
> > @@ -89,10 +110,18 @@ enum hp_wmi_commandtype {
> >  	HPWMI_THERMAL_PROFILE_QUERY	= 0x4c,
> >  };
> >
> > +enum hp_wmi_gm_commandtype {
> > +	HPWMI_FAN_SPEED_GET_QUERY = 0x11,
> > +	HPWMI_SET_PERFORMANCE_MODE = 0x1A,
> > +	HPWMI_FAN_SPEED_MAX_GET_QUERY = 0x26,
> > +	HPWMI_FAN_SPEED_MAX_SET_QUERY = 0x27,
> > +};
> > +
> >  enum hp_wmi_command {
> >  	HPWMI_READ	= 0x01,
> >  	HPWMI_WRITE	= 0x02,
> >  	HPWMI_ODM	= 0x03,
> > +	HPWMI_GM	= 0x20008,
> >  };
> >
> >  enum hp_wmi_hardware_mask {
> > @@ -120,6 +149,13 @@ enum hp_wireless2_bits {
> >  	HPWMI_POWER_FW_OR_HW	= HPWMI_POWER_BIOS | HPWMI_POWER_HARD,
> >  };
> >
> > +
> > +enum hp_thermal_profile_omen {
> > +	HP_OMEN_THERMAL_PROFILE_DEFAULT     = 0x00,
> > +	HP_OMEN_THERMAL_PROFILE_PERFORMANCE = 0x01,
> > +	HP_OMEN_THERMAL_PROFILE_COOL        = 0x02,
> > +};
> > +
> >  enum hp_thermal_profile {
> >  	HP_THERMAL_PROFILE_PERFORMANCE	= 0x00,
> >  	HP_THERMAL_PROFILE_DEFAULT		= 0x01,
> > @@ -169,6 +205,8 @@ static struct platform_device *hp_wmi_platform_dev;
> >  static struct platform_profile_handler platform_profile_handler;
> >  static bool platform_profile_support;
> >
> > +static bool use_omen_thermal_profile;
> 
> I think this variable is not necessary, you set it once,
> and read it once. Maybe you could add a direct function
> call to `detect_is_omen_thermal_profile()` in `thermal_profile_setup()`?
Got it. At first I had that variable just be `is_omen`, but I noticed in the 
Windows Command Center code that not all omens support thermal profile
switching this way so i changed it to be more descriptive. Will change.
> 
> 
> > [...]
> >  static int hp_wmi_read_int(int query)
> >  {
> >  	int val = 0, ret;
> > @@ -302,6 +358,75 @@ static int hp_wmi_hw_state(int mask)
> >  	return !!(state & mask);
> >  }
> >
> > +static int omen_thermal_profile_set(int mode)
> > +{
> > +	char buffer[2] = {0, mode};
> > +	int ret;
> > +
> > +	if (mode < 0 || mode > 2)
> > +		return -EINVAL;
> > +
> > +	ret = hp_wmi_perform_query(HPWMI_SET_PERFORMANCE_MODE, HPWMI_GM,
> > +				   &buffer, sizeof(buffer), sizeof(buffer));
> > +
> > +	if (ret)
> > +		return ret < 0 ? ret : -EINVAL;
> > +
> > +	return mode;
> > +}
> > +
> > +static bool detect_is_omen_thermal_profile(void)
> > +{
> > +	int i;
> > +
> > +	const char *board_name = dmi_get_system_info(DMI_BOARD_NAME);
> 
> It seems that this can be NULL. Most users of this function have
> a NULL check after the call, so please add one here as well.
Got it.
> 
> 
> > +
> > +	for (i = 0; i < ARRAY_SIZE(omen_thermal_profile_boards); i++) {
> > +		if (strcmp(board_name, omen_thermal_profile_boards[i]) == 0)
> > +			return true;
> > +	}
> 
> Please see the `match_string()` function.
Was looking for something like that. Thanks.
> 
> 
> > +
> > +	return false;
> > +}
> > [...]
> 
> 
> Best regards,
> Barnabás Pőcze


Thanks for the suggestions,
Enver.
