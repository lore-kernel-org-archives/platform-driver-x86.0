Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F31C4332F
	for <platform-driver-x86@archiver.kernel.org>; Sun, 13 Nov 2022 20:30:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235411AbiKMUaw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 13 Nov 2022 15:30:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbiKMUau (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Nov 2022 15:30:50 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2672712608
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Nov 2022 12:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1668371440; bh=swbK7YxEmrqiCw4vmZyK4igs8pEzOy7yOJ25cvwv/a8=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=aay9swxRPZ95vUrqvgY7JgnPUY0sPrv0JcKhufNIgE6OztJVe03jppHGIwPFPgxQP
         /uMOJlbiy6xhnI1H0y6R2aKVSKRCbwrcevMa6AhPmO92KtWnsNx7kDYrSTzVBuz3fk
         qoKSdzwLgIxW4QpUMvGoWr4YX7/N4GCaSSaXNV0ipfRCMOWIqVYSy1X7fv3kRTw7PI
         3MxT64uOP385O/FUPU+skKoGGgCZt3jcD3DjuKGwf2Cot8KlQWqyKF/H3Yz/BaiAHo
         PD+U+vQBzVLSechSPU6jIH+D85hYDu7xUY9L0cZAtHHIlh9PBpr2LCA/XpAoQdj7kG
         7oGzNclgFMtOw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mqs0R-1pGBxx0zmT-00mvkJ; Sun, 13
 Nov 2022 21:30:40 +0100
Subject: Re: [PATCH v2 1/2] platform/x86: wmi: Disambiguate WMI event data on
 some ACPI tables
To:     Philipp Jungkamp <p.jungkamp@gmx.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <8d54fbbb-0933-aaea-5f66-bb7807f5506d@redhat.com>
 <20221113121259.14895-1-p.jungkamp@gmx.net>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <828b7403-40a2-0da4-6bd2-b2370f05f998@gmx.de>
Date:   Sun, 13 Nov 2022 21:30:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20221113121259.14895-1-p.jungkamp@gmx.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:IhP1syQs99wNP1BQZOB7dnXafvboIpGj3Gm0yVX53294bI58z0C
 6abY7cQxYAw/A5UqJ4uEnX6PBDjh4PffVuRd9XrXwWPFnz9dj0D0ReqlEyNCaRNGP6lG6Zd
 egTdVoo1Qe2nHl3UqgirEkCM8XVAIjNK4nZIWxxSYl7vACZsLWy1vqwOwyzaHbYuAv+lewp
 ASABGrmbHIMvWJ9ys3YIg==
UI-OutboundReport: notjunk:1;M01:P0:Rssv5hV7P6E=;5bcJD8N2vt3NKQVicPo1ygJ2BPr
 2VxVMh4Rksb1/HUKKUHYIOiu1HwRsGWJqmz5WKQmudJ5ECzPVd74IB/8fUBRdStzQBwsNXPbD
 jwqIFY3pYyx5PmsOmcl3GIhiGnuk1JHZ7peIcWQ8ysMtyr4v4SaADWGnPu8BG5sAPhKPXcgQw
 BjrcUXEeYkcDevFoNCgG5QbcBnhaJKNWGU27vg3wW66+HUV+Odej6KdKALOvx5R9Adz5TkVCW
 XXNZUUZM3k5Bo/eYCVVXD6eaMFFMg2DTDoncrBEX+ctqoW4vUXC+Mj/sJspSNI1E+dGZQ9IyU
 n2kVDVhNbtnXjHXZ/GXc4c0cngXmnYkV59akQ4o4G9IcSjca26fBD+3nkj46w9D7Ykq72DWuk
 EPH+LTVg+tG/nCkoVpjgyjqZOCGLWw/iYXDreC23ZuQ3hIy1FtgQXmse/HvuT0y6yLQ1PzHZR
 ph9Hv6G1P6CthkZDzSyupZZVY6PVneybz6vmH8B/ZQizcQjJtgkY8r3qHp7GMdKrGDSgkAVtI
 UQ22fGj/imVzt5kXc60yHHhDCBSlFFt2jyw7w0i4S63uwIRmtRAf7gkDIf7oeyyi3c7dzjRPl
 gzAls3RkrSruXcEz+M+R+JYTw1ha6S3Y6NLUwS6AruUGm3rj9/IyHFqeUXSEDRw5RQWV3AdjV
 eWbZRTYe7XF7Yn9fMRFQ0Egq3YpyRB9BV1roe8SCmSymXGElNfk8/PkmbsDwDnSRpzuH6Z+4y
 Xp79kGRbcsuFTbKQoVQze5YgTkGVztRuToihH2vZ19o2CaIQc7M/YmiEEoLz0wlYNXMDjYF3h
 KefY+V0ofiF+KPwJWWtZdG/iMTNzcKK+eqX4keqy9AyfXpcBnnf1Avxj7HxBcMCbSJCTkXuAz
 c3Z02MegsBnyslA2sxBqG+RTQfgDtsEsC0tHC6FiD2T+WcUwdrnhOYwENhBPLjOhCMhvGkvfO
 J+qKKQYSmzOhFgUAVp6RAp2RVFM=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Am 13.11.22 um 13:12 schrieb Philipp Jungkamp:

> The ACPI DSDT table includes multiple WMI blocks which emit events with
> the same notify_id. The wmi_get_event_data() function chooses the
> wmi_block with the _WED handler to call based on the notify_id. This
> function may call the wrong _WED event handler based on the order the
> WMI blocks are parsed.
>
> This introduces wmi_get_event_data_with_guid() to diambiguate the _WED
> call to get metadata for an event. The GUID here is the one of the
> containing WMI block, not the one of the WMI event itself.

Hello,

maybe it would be better to instead rewrite the driver to utilize the WMI bus infrastructure?
Because a GUID is not guaranteed to be unique inside a system, there would still be a chance
to call the wrong _WED handler.
AFAIK only utilizing the WMI bus infrastructure would fully disambiguate the WMI event data.

Armin Wolf

> Signed-off-by: Philipp Jungkamp <p.jungkamp@gmx.net>
> ---
> Was separating this change into it's own commit correct?
>
>   drivers/platform/x86/wmi.c | 30 ++++++++++++++++++++++++++++++
>   include/linux/acpi.h       |  3 +++
>   2 files changed, 33 insertions(+)
>
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 223550a10d4d..56b666f4b40b 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -659,6 +659,36 @@ acpi_status wmi_get_event_data(u32 event, struct acpi_buffer *out)
>   }
>   EXPORT_SYMBOL_GPL(wmi_get_event_data);
>
> +/**
> + * wmi_get_event_data_with_guid - Get WMI data associated with an event by guid
> + *
> + * Consider using this instead of wmi_get_event_data() when the notify_id
> + * of the WMI event may not be unique among all WMI blocks of a device.
> + *
> + * @guid: GUID of the WMI block for this event
> + * @event: Event to find
> + * @out: Buffer to hold event data. out->pointer should be freed with kfree()
> + *
> + * Returns extra data associated with an event in WMI.
> + */
> +acpi_status wmi_get_event_data_with_guid(const char *guid, u32 event, struct acpi_buffer *out)
> +{
> +	struct wmi_block *wblock = NULL;
> +	struct guid_block *gblock;
> +	acpi_status status;
> +
> +	status = find_guid(guid, &wblock);
> +	if (ACPI_FAILURE(status))
> +		return AE_NOT_FOUND;
> +
> +	gblock = &wblock->gblock;
> +	if ((gblock->flags & ACPI_WMI_EVENT) && gblock->notify_id == event)
> +		return get_event_data(wblock, out);
> +
> +	return AE_NOT_FOUND;
> +}
> +EXPORT_SYMBOL_GPL(wmi_get_event_data_with_guid);
> +
>   /**
>    * wmi_has_guid - Check if a GUID is available
>    * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 3015235d65e3..51ac4d6bcae1 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -423,6 +423,9 @@ extern acpi_status wmi_set_block(const char *guid, u8 instance,
>   extern acpi_status wmi_install_notify_handler(const char *guid,
>   					wmi_notify_handler handler, void *data);
>   extern acpi_status wmi_remove_notify_handler(const char *guid);
> +extern acpi_status wmi_get_event_data_with_guid(const char *guid,
> +						u32 event,
> +						struct acpi_buffer *out);
>   extern acpi_status wmi_get_event_data(u32 event, struct acpi_buffer *out);
>   extern bool wmi_has_guid(const char *guid);
>   extern char *wmi_get_acpi_device_uid(const char *guid);
> --
> 2.38.1
>
