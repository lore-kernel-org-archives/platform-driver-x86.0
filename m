Return-Path: <SRS0=xf+z=EP=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8A7C2D0A3
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Nov 2020 14:20:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB3D72076E
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Nov 2020 14:20:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AIPj+Tud"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731256AbgKIOUu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Nov 2020 09:20:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53323 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730259AbgKIOUu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Nov 2020 09:20:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604931648;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3GirLBpi879PFkRlJfPg2SEXQxpmG/pbhdFRWinYDkA=;
        b=AIPj+TudmBf96AXHl9+7kR8Vjojw+4yEVtftlpSjaCiQaD44/LlSFzFsE/CTy1H8vdAHdb
        zHcMxPETAQreEuEYBfl4bftlBwA0Y3ExIkMt983Zb9emUgjpWlVjtsCraPj3RNJwJbRTxv
        SmzXS79YpXO7FnuVI1/gb+yKzkxYXvw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-xNDsdmuVOXSChukmE6P0Ng-1; Mon, 09 Nov 2020 09:20:46 -0500
X-MC-Unique: xNDsdmuVOXSChukmE6P0Ng-1
Received: by mail-ej1-f70.google.com with SMTP id gj4so3472489ejb.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2020 06:20:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3GirLBpi879PFkRlJfPg2SEXQxpmG/pbhdFRWinYDkA=;
        b=X8U1XK4kZmQ4RrqcyEf7Garj6zn60Bok2vAA/OePt8IyP18s7vAt35R6VLyO7LeNm5
         nP6MoYKp/hjcNumV7gSV0FhJYeHEzi3rscr+GuShym+tYW7PZuaI1E7OHS2w23D8Yhmr
         SmEb+5Te4MblYZJy5oevJ9J2X37qdoXYgigZ6lRLN6yvHQPFsSZoWqZ+UdBQ9p03L9bH
         AdI5KoeDosmNfAAJk4aLby4jfIrykcsWBZrYvBRigcaAc94tHjzcmCdyaQAtI3KNIt8/
         PxbZ42bIYD9XDtM4NN2BcywbnbrYxCO0cGEyjenP23kzLDaK7i2qmqwv8G9pIfjhTiL0
         hN8Q==
X-Gm-Message-State: AOAM533KOtPdDL2GNLf5HGVGQ/ByAsPFt5ix3VaIQFIeLbLk6in/QDGt
        DEOZnfvKG3vBhIw/TVhAjkUxZWeNn+oZxGAXseSWw3th3jm5MeorbwNhi/1p0PpsMCh5Q3DMLd/
        fx0kdpmR1QoHHPxvhCeo7s0I2zZLZ3cajBA==
X-Received: by 2002:a17:906:51dd:: with SMTP id v29mr15385920ejk.69.1604931645167;
        Mon, 09 Nov 2020 06:20:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXYUcVfiSA0+uP64xp4XLTc2cYV9DudThxaEnIS+4DqJsY5eLEZV2iHqtd4brQNX8Qekhecw==
X-Received: by 2002:a17:906:51dd:: with SMTP id v29mr15385899ejk.69.1604931644933;
        Mon, 09 Nov 2020 06:20:44 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id l8sm8995459ejk.67.2020.11.09.06.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 06:20:44 -0800 (PST)
Subject: Re: [PATCH RESEND] platform/x86: intel-hid: fix _DSM function index
 handling
To:     Zhen Gong <zhengong@usc.edu>, Alex Hung <alex.hung@canonical.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
References: <CAJCLVRCyp0ASdWTx-PxsrDC9zFBPw0U2AtPip+_Hpj2r5gUPwA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <963f6b8a-bc85-0c48-bb8f-f9cace99389b@redhat.com>
Date:   Mon, 9 Nov 2020 15:20:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAJCLVRCyp0ASdWTx-PxsrDC9zFBPw0U2AtPip+_Hpj2r5gUPwA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/8/20 10:23 AM, Zhen Gong wrote:
> According to the ACPI spec 9.1.1 _DSM (Device Specific Method),
> intel_hid_dsm_fn_mask, acquired from function index 0, is "a buffer
> containing one bit for each function index". When validitaing fn_index,
> it should be compared with corresponding bit.
> 
> This buffer is usually longer than a byte. Depending on whether
> INTEL_HID_DSM_HEBC_V2_FN exist, it could be either
> "Buffer (0x02) { 0xFF, 0x01 }" or "Buffer (0x02) { 0xFF, 0x03 }".
> Probably it won't grow larger according to the description. On older
> platforms, available functions could be fewer or not supported at all,
> i.e., "Buffer (One) { 0x00 }".
> 
> Signed-off-by: Zhen Gong <zhengong@usc.edu>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Note your mail client completely mangled the patch, eating whitespace
and replacing tabs with spaces. I've fixed this up manually for this time.

Next time please use git send-email and do NOT invoke an editor to
change e.g. the subject, instead use the command line options to set
a patch subject prefix.

Regards,

Hans

> ---
>  drivers/platform/x86/intel-hid.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
> index 86261970bd8f..9a52e56f75da 100644
> --- a/drivers/platform/x86/intel-hid.c
> +++ b/drivers/platform/x86/intel-hid.c
> @@ -141,7 +141,7 @@ static bool intel_hid_execute_method(acpi_handle handle,
> 
>   method_name = (char *)intel_hid_dsm_fn_to_method[fn_index];
> 
> - if (!(intel_hid_dsm_fn_mask & fn_index))
> + if (!(intel_hid_dsm_fn_mask & BIT(fn_index)))
>   goto skip_dsm_exec;
> 
>   /* All methods expects a package with one integer element */
> @@ -214,7 +214,19 @@ static void intel_hid_init_dsm(acpi_handle handle)
>   obj = acpi_evaluate_dsm_typed(handle, &intel_dsm_guid, 1, 0, NULL,
>        ACPI_TYPE_BUFFER);
>   if (obj) {
> - intel_hid_dsm_fn_mask = *obj->buffer.pointer;
> + switch (obj->buffer.length) {
> + default:
> + case 2:
> + intel_hid_dsm_fn_mask = *(u16 *)obj->buffer.pointer;
> + break;
> + case 1:
> + intel_hid_dsm_fn_mask = *obj->buffer.pointer;
> + break;
> + case 0:
> + acpi_handle_warn(handle, "intel_hid_dsm_fn_mask length is zero\n");
> + intel_hid_dsm_fn_mask = 0;
> + break;
> + }
>   ACPI_FREE(obj);
>   }
> 

