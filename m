Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6642C433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Feb 2021 19:11:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7ACEF64D8F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Feb 2021 19:11:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbhBKTDU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 Feb 2021 14:03:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46495 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231710AbhBKTB0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Feb 2021 14:01:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613069991;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wWb20/hawOjYd98KHpX1rzfF+JmuPeWa2f9CoF+ZdqE=;
        b=ZAjViBveXLeSjaKlxkpqP7DJ7Rpe3/vGPV0O+q1UMOGH65jLmWuVHS+GAWitm+lLhRGJJa
        iTKB6ZRgaPyd/qLWpHXfxSGOu15/RORrkN8raTVzHjRaYtNwn8KLtfkKzFOOJLU1IWEvwc
        fZLpM+G58bIZJi9pqoKePj6GP+p3U9E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-H3yMM28KOD-pm-yw1-l6gA-1; Thu, 11 Feb 2021 13:59:49 -0500
X-MC-Unique: H3yMM28KOD-pm-yw1-l6gA-1
Received: by mail-ej1-f71.google.com with SMTP id jz15so5287522ejc.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Feb 2021 10:59:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wWb20/hawOjYd98KHpX1rzfF+JmuPeWa2f9CoF+ZdqE=;
        b=IhjYRd7tvcADMNMwVAFm5FZg7mwX4KHr79WXUXJsl7Bpa/udx0F02ZToHp0ahixWh8
         Q/a1Ls7GfLRcHEgMAAZ3aK6KiBZJ5C06SCuE1Lo287Vr4j6D4NStKGcxkZWQwbI75F8I
         OVsWjW1BC3tc3jNdPxS9VkG1ykhNY/g+fqcTOQTTxmreTvSyFR2+giH3at8eH70YLZrv
         qjq/MXpuecobzZQ8Jtj0LCUL6pN/EKIiXMdcRDgk05lqxhB4oahaa2gDvfZJBD9Maft/
         gAsCJcA9d3RpaSUTAx9GYRxk1JTW+NKVmx+4ADKM1ogBY3X4o7ZDQJs8Z7lynkDzPFAt
         Lbgg==
X-Gm-Message-State: AOAM530Hwabz/8Nr2DcSH/MvP7adwcqTlgDBhRR7Bp8hPvz48ZPBUGkM
        y6GxRaOgLkph5GRT9Kvo2gwEIxUPh55ylFQO5WoLQHIBPjgDil2eym9bsSoHqx0L5wX8Zm8jgFE
        Wko9vSfrpslj8GUXCs/5C8ge7s4O1zKBDOA==
X-Received: by 2002:a05:6402:b0f:: with SMTP id bm15mr9611294edb.133.1613069987815;
        Thu, 11 Feb 2021 10:59:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfqBkBWOJk6SbFIlrq8pufXF9KVmfS3yOtwzO3y6XWfR13C2QP5/308mZr/wVdxDgqeSyjRw==
X-Received: by 2002:a05:6402:b0f:: with SMTP id bm15mr9611280edb.133.1613069987595;
        Thu, 11 Feb 2021 10:59:47 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id dv17sm2696188ejb.25.2021.02.11.10.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Feb 2021 10:59:47 -0800 (PST)
Subject: Re: [PATCH v4] platform/x86: thinkpad_acpi: Handle keyboard cover
 attach/detach events
To:     Alexander Kobel <a-kobel@a-kobel.de>,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Pearson <mpearson@lenovo.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
References: <e552a7d9-0892-2f03-62ff-c19da24a8ba3@a-kobel.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <89733acc-33c1-2705-8adf-1d17961d64ee@redhat.com>
Date:   Thu, 11 Feb 2021 19:59:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e552a7d9-0892-2f03-62ff-c19da24a8ba3@a-kobel.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/11/21 8:35 AM, Alexander Kobel wrote:
> ThinkPad X1 Tablets emit HKEY 0x4012 and 0x4013 events when a keyboard
> cover is attached/detached or folded to the back of the device. They are
> used to switch from normal to tablet mode in userspace; e.g., to offer
> touch keyboard choices when focus goes to a text box and no keyboard is
> attached, or to enable autorotation of the display according to the
> built-in orientation sensor.
> 
> This patch handles the two events by issuing corresponding
> SW_TABLET_MODE notifications to the ACPI userspace.
> 
> Tested as working on a ThinkPad X1 Tablet Gen 2, 20JCS00C00, and as
> non-interfering with a ThinkPad X1 Carbon 7th, 20QESABM02 (normal
> clamshell, so it does not have a keyboard cover).
> 
> Signed-off-by: Alexander Kobel <a-kobel@a-kobel.de>

Thank you for your patch, overall this looks good, I have one
request for some refactoring inline / below.

> ---
>  drivers/platform/x86/thinkpad_acpi.c | 100 ++++++++++++++++++++++++++-
>  1 file changed, 99 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index c404706379d9..09adcaf49fe8 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -145,6 +145,45 @@ enum {
>  	TP_ACPI_WGSV_STATE_UWBPWR	= 0x0020, /* UWB radio enabled */
>  };
>  
> +/* ThinkPad GTOP ("Get Tablet OPtion") methods */
> +enum {
> +	TP_GTOP_CMD_QUERY_VERSION		= 0x0000,
> +	TP_GTOP_CMD_QUERY_INTERFACE_TYPE	= 0x0100,
> +	TP_GTOP_CMD_GET_ATTACH_OPTION		= 0x0200,
> +};
> +
> +#define TP_GTOP_MINIMUM_VERSION	0x0103
> +
> +enum {
> +	TP_GTOP_INTERFACE_TYPE_RESERVED		= 0,
> +	TP_GTOP_INTERFACE_TYPE_ANY_TYPE		= 1,
> +	TP_GTOP_INTERFACE_TYPE_TP_HELIX		= 2,
> +	TP_GTOP_INTERFACE_TYPE_TP10		= 3,
> +	TP_GTOP_INTERFACE_TYPE_TP_X1_TAB	= 4,
> +};
> +
> +/* Attach option states for GTOP Type 1 interfaces ("Any type") */
> +#define TP_GTOP_ANY_TYPE_STATE_ANY_OPTION_ATTACHED	BIT(0)
> +
> +/*
> + * Attach option states for GTOP Type 4 interfaces ("ThinkPad X1 Tablet series")
> + * 0: detached, 1: attached
> + * except for special meanings for Pico cartridge and folio keyboard cover location
> + */
> +#define TP_GTOP_TP_X1_TAB_STATE_THIN_KBD_ATTACHED		BIT(0)
> +#define TP_GTOP_TP_X1_TAB_STATE_PRO_CARTRIDGE_ATTACHED		BIT(1)
> +#define TP_GTOP_TP_X1_TAB_STATE_PICO_CARTRIDGE_ATTACH_MASK	GENMASK(3, 2)
> +#define TP_GTOP_TP_X1_TAB_STATE_3D_CARTRIDGE_ATTACHED		BIT(4)
> +#define TP_GTOP_TP_X1_TAB_STATE_RESERVE1_ATTACHED		BIT(5)
> +#define TP_GTOP_TP_X1_TAB_STATE_RESERVE2_ATTACHED		BIT(6)
> +#define TP_GTOP_TP_X1_TAB_STATE_FOLIO_KBD_FOLDED_ONTO_BACK	BIT(16)
> +
> +/* Special values for Pico cartridge state (bits 3-2) */
> +#define TP_GTOP_TP_X1_TAB_STATE_PICO_CARTRIDGE_DETACHED		0
> +#define TP_GTOP_TP_X1_TAB_STATE_PICO_CARTRIDGE_ATTACHED		BIT(2)
> +#define TP_GTOP_TP_X1_TAB_STATE_PICO_CARTRIDGE_BATTERY_ERROR	BIT(3)
> +#define TP_GTOP_TP_X1_TAB_STATE_PICO_CARTRIDGE_RESERVED		(BIT(2) | BIT(3))
> +
>  /* HKEY events */
>  enum tpacpi_hkey_event_t {
>  	/* Hotkey-related */
> @@ -174,6 +213,12 @@ enum tpacpi_hkey_event_t {
>  						     or port replicator */
>  	TP_HKEY_EV_HOTPLUG_UNDOCK	= 0x4011, /* undocked from hotplug
>  						     dock or port replicator */
> +	/*
> +	 * Thinkpad X1 Tablet series devices emit 0x4012 and 0x4013
> +	 * when keyboard cover is attached, detached or folded onto the back
> +	 */
> +	TP_HKEY_EV_KBD_COVER_ATTACH	= 0x4012, /* keyboard cover attached */
> +	TP_HKEY_EV_KBD_COVER_DETACH	= 0x4013, /* keyboard cover detached or folded back */
>  
>  	/* User-interface events */
>  	TP_HKEY_EV_LID_CLOSE		= 0x5001, /* laptop lid closed */
> @@ -308,6 +353,10 @@ static struct {
>  		TP_HOTKEY_TABLET_NONE = 0,
>  		TP_HOTKEY_TABLET_USES_MHKG,
>  		TP_HOTKEY_TABLET_USES_GMMS,
> +		TP_HOTKEY_TABLET_USES_GTOP_ANY_TYPE,
> +		TP_HOTKEY_TABLET_USES_GTOP_TP_HELIX,
> +		TP_HOTKEY_TABLET_USES_GTOP_TP10,
> +		TP_HOTKEY_TABLET_USES_GTOP_TP_X1_TAB,
>  	} hotkey_tablet;
>  	u32 kbdlight:1;
>  	u32 light:1;
> @@ -2166,11 +2215,32 @@ static int hotkey_gmms_get_tablet_mode(int s, int *has_tablet_mode)
>  	return !!(mode & TP_ACPI_MULTI_MODE_TABLET_LIKE);
>  }
>  
> +static bool hotkey_gtop_any_type_get_tablet_mode(int s)
> +{
> +	return !(s & TP_GTOP_ANY_TYPE_STATE_ANY_OPTION_ATTACHED);
> +}
> +
> +static bool hotkey_gtop_tp_x1_tab_get_tablet_mode(int s)
> +{
> +	return (!(s & TP_GTOP_TP_X1_TAB_STATE_THIN_KBD_ATTACHED) ||
> +		(s & TP_GTOP_TP_X1_TAB_STATE_FOLIO_KBD_FOLDED_ONTO_BACK));
> +}
> +
>  static int hotkey_get_tablet_mode(int *status)
>  {
>  	int s;
>  
>  	switch (tp_features.hotkey_tablet) {
> +	case TP_HOTKEY_TABLET_USES_GTOP_ANY_TYPE:
> +		if (!acpi_evalf(hkey_handle, &s, "GTOP", "dd", TP_GTOP_CMD_GET_ATTACH_OPTION))
> +			return -EIO;
> +		*status = hotkey_gtop_any_type_get_tablet_mode(s);
> +		break;
> +	case TP_HOTKEY_TABLET_USES_GTOP_TP_X1_TAB:
> +		if (!acpi_evalf(hkey_handle, &s, "GTOP", "dd", TP_GTOP_CMD_GET_ATTACH_OPTION))
> +			return -EIO;
> +		*status = hotkey_gtop_tp_x1_tab_get_tablet_mode(s);
> +		break;
>  	case TP_HOTKEY_TABLET_USES_MHKG:
>  		if (!acpi_evalf(hkey_handle, &s, "MHKG", "d"))
>  			return -EIO;
> @@ -3213,7 +3283,29 @@ static int hotkey_init_tablet_mode(void)
>  	int in_tablet_mode = 0, res;
>  	char *type = NULL;
>  
> -	if (acpi_evalf(hkey_handle, &res, "GMMS", "qdd", 0)) {
> +	if (acpi_evalf(hkey_handle, &res, "GTOP", "qdd", TP_GTOP_CMD_QUERY_VERSION) &&
> +	    res >= TP_GTOP_MINIMUM_VERSION &&
> +	    acpi_evalf(hkey_handle, &res, "GTOP", "qdd", TP_GTOP_CMD_QUERY_INTERFACE_TYPE)) {
> +		switch (res) {
> +		case TP_GTOP_INTERFACE_TYPE_ANY_TYPE:
> +			tp_features.hotkey_tablet = TP_HOTKEY_TABLET_USES_GTOP_ANY_TYPE;
> +			if (acpi_evalf(hkey_handle, &res, "GTOP", "qdd",
> +				       TP_GTOP_CMD_GET_ATTACH_OPTION))
> +				in_tablet_mode = hotkey_gtop_any_type_get_tablet_mode(res);
> +			type = "GTOP";
> +			break;
> +		case TP_GTOP_INTERFACE_TYPE_TP_X1_TAB:
> +			tp_features.hotkey_tablet = TP_HOTKEY_TABLET_USES_GTOP_TP_X1_TAB;
> +			if (acpi_evalf(hkey_handle, &res, "GTOP", "qdd",
> +				       TP_GTOP_CMD_GET_ATTACH_OPTION))
> +				in_tablet_mode = hotkey_gtop_tp_x1_tab_get_tablet_mode(res);
> +			type = "GTOP";
> +			break;
> +		default:
> +			pr_err("unsupported GTOP type, please report this to %s\n", TPACPI_MAIL);

Please use dev_err(&tpacpi_pdev->dev, ...
and please print the res value;

Also please change this to a dev_warn, see below.

> +			break;
> +		}

This means that if there is a GTOP, but the TP_GTOP_CMD_QUERY_INTERFACE_TYPE is unknown
we won't register a SW_TABLET_MODE even though there might be a working GMMS function.

Also the size of the tests here makes it hard to see the if ... else if ... else if ...
structure which we have here.

Can you factor out the GTOP probing / detecting into a
hotkey_detect_gtop_tablet_mode() helper which returns true on success?

Then you can also avoid changing all the tests together with &&.

Instead you should end up with something like this:

bool hotkey_detect_gtop_tablet_mode(void) {
	int res;

	if (!acpi_evalf(hkey_handle, &res, "GTOP", "qdd", TP_GTOP_CMD_QUERY_VERSION))
		return false;

	if (res < TP_GTOP_MINIMUM_VERSION)
		return false;

	if (!acpi_evalf(hkey_handle, &res, "GTOP", "qdd", TP_GTOP_CMD_QUERY_INTERFACE_TYPE))
		return false;

	switch (type) {
	case TP_GTOP_INTERFACE_TYPE_ANY_TYPE:
		tp_features.hotkey_tablet = TP_HOTKEY_TABLET_USES_GTOP_ANY_TYPE;
		break;
	case TP_GTOP_INTERFACE_TYPE_TP_X1_TAB:
		tp_features.hotkey_tablet = TP_HOTKEY_TABLET_USES_GTOP_TP_X1_TAB;
		break;
	default:
		dev_warn(&tpacpi_pdev->dev, "unsupported GTOP type %d, please report this to %s\n", res, TPACPI_MAIL);
		return false;
	}

	return true;
}

And then in hotkey_init_tablet_mode() you can have just this:

+	if (hotkey_detect_gtop_tablet_mode(status)) {
+		hotkey_get_tablet_mode(&in_tablet_mode);
+		type = "GTOP";
+	} else if (acpi_evalf(hkey_handle, &res, "GMMS", "qdd", 0)) {
 		int has_tablet_mode;


Which is a lot cleaner and will result in fallback to GMMS in the "unsupported GTOP type" case.
Notice I also reused hotkey_get_tablet_mode() to get the mode here, avoiding some duplication.

Regards,

Hans




>  
>  		in_tablet_mode = hotkey_gmms_get_tablet_mode(res,
> @@ -3989,6 +4081,12 @@ static bool hotkey_notify_dockevent(const u32 hkey,
>  	case TP_HKEY_EV_HOTPLUG_UNDOCK: /* undocked from port replicator */
>  		pr_info("undocked from hotplug port replicator\n");
>  		return true;
> +	case TP_HKEY_EV_KBD_COVER_ATTACH:
> +	case TP_HKEY_EV_KBD_COVER_DETACH:
> +		tpacpi_input_send_tabletsw();
> +		hotkey_tablet_mode_notify_change();
> +		*send_acpi_ev = false;
> +		return true;
>  
>  	default:
>  		return false;
> 

