Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB55CDB474
	for <platform-driver-x86@archiver.kernel.org>; Fri, 20 Oct 2023 17:55:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377713AbjJTRzW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 20 Oct 2023 13:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjJTRzV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Oct 2023 13:55:21 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFAD3C0
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Oct 2023 10:55:19 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1ca3a54d2c4so8983705ad.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Oct 2023 10:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697824519; x=1698429319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cXRPLR5ycOJvFtuZ89e+XHsnah9sAcEBlf+8VSirbq0=;
        b=T4326qkqiPLK4BUDNkBl/nfQhS+63u3EdY6EiKH65sl7xu2OUG08H1w/c6UftGK2XH
         oxtmvQryWpjGPjCbAXAcAtpDaKy1RnCoJu4BLthwEnQm+NnDJOLCXoEyDejGccSzGwHH
         svDc6MfAcXIOo/HapPNIx2khDhY9o1P9Raw30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697824519; x=1698429319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXRPLR5ycOJvFtuZ89e+XHsnah9sAcEBlf+8VSirbq0=;
        b=U1Oz2PHIu78Dw+Juvd6uoQCUx8nyfhoI7EPxuuSd8aWZkEJc3205WARfMq61b/7LlC
         AjMIOGlK2ls5Mil+1OD2qQMikjBes0g/Jwx8lJUD0LHnLqLvjOzPKUu1r07UQOR0qP5r
         Fwt7Tn/Jk+ujud3stxDnJyDtXUo/4jxqSw651Ylmdm8QGBdzkrlTS9hUMefRFq8evMJ7
         cMiAh4Snm7nW1QuHGOTmHt3PxJexwqfRmoOpFBS21X9Ln1ZQTkGtnQOON0cGqyXTgttq
         i2YWkodi1iRwAVz8Oa0VJWKBtkVv/5/Q2RZse/p7x+JnfyQxAp5FYy+YtI1R9Q34+Wut
         v2/g==
X-Gm-Message-State: AOJu0YzZK6z2fY1494ER9Kp4+AP4vcbYfpY3ZCDVrOuXcPdRL7FTL3/i
        9q8/LN51wo08nh9OVFhjgcc53w==
X-Google-Smtp-Source: AGHT+IFWeCE7pBLBYDxNiZ5IjEZJN60R7GHKuWzvVUgG84ddCDT/Art1ECJOGqO0zTkIY662eP+Fzg==
X-Received: by 2002:a17:902:f342:b0:1ca:7669:fbb0 with SMTP id q2-20020a170902f34200b001ca7669fbb0mr2281625ple.49.1697824519227;
        Fri, 20 Oct 2023 10:55:19 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id i13-20020a170902eb4d00b001c9b384731esm1796558pli.270.2023.10.20.10.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 10:55:18 -0700 (PDT)
Date:   Fri, 20 Oct 2023 10:55:17 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Justin Stitt <justinstitt@google.com>
Cc:     Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Hans de Goede <hdegoede@redhat.com>,
        Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: replace deprecated strncpy
 with memcpy
Message-ID: <202310201054.C82BF91@keescook>
References: <20231020-strncpy-drivers-platform-x86-thinkpad_acpi-c-v1-1-312f2e33034f@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020-strncpy-drivers-platform-x86-thinkpad_acpi-c-v1-1-312f2e33034f@google.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Oct 20, 2023 at 05:52:43PM +0000, Justin Stitt wrote:
> strncpy() is deprecated for use on NUL-terminated destination strings
> [1] and as such we should prefer more robust and less ambiguous
> interfaces.
> 
> We expect ec_fw_string to be NUL-terminated based on its use with format
> strings in thinkpad_acpi.c:
> 11241 | pr_notice("ThinkPad firmware release %s doesn't match the known patterns\n",
> 11242 |     ec_fw_string);
> 
> Moreover, NUL-padding is not required since ec_fw_string is explicitly
> zero-initialized:
> 11185 | char ec_fw_string[18] = {0};
> 
> When carefully copying bytes from one buffer to another in
> pre-determined blocks (like what's happening here with dmi_data):
> 
> |       static void find_new_ec_fwstr(const struct dmi_header *dm, void *private)
> |       {
> |       	char *ec_fw_string = (char *) private;
> |       	const char *dmi_data = (const char *)dm;
> |       	/*
> |       	 * ThinkPad Embedded Controller Program Table on newer models
> |       	 *
> |       	 * Offset |  Name                | Width  | Description
> |       	 * ----------------------------------------------------
> |       	 *  0x00  | Type                 | BYTE   | 0x8C
> |       	 *  0x01  | Length               | BYTE   |
> |       	 *  0x02  | Handle               | WORD   | Varies
> |       	 *  0x04  | Signature            | BYTEx6 | ASCII for "LENOVO"
> |       	 *  0x0A  | OEM struct offset    | BYTE   | 0x0B
> |       	 *  0x0B  | OEM struct number    | BYTE   | 0x07, for this structure
> |       	 *  0x0C  | OEM struct revision  | BYTE   | 0x01, for this format
> |       	 *  0x0D  | ECP version ID       | STR ID |
> |       	 *  0x0E  | ECP release date     | STR ID |
> |       	 */
> |
> |       	/* Return if data structure not match */
> |       	if (dm->type != 140 || dm->length < 0x0F ||
> |       	memcmp(dmi_data + 4, "LENOVO", 6) != 0 ||
> |       	dmi_data[0x0A] != 0x0B || dmi_data[0x0B] != 0x07 ||
> |       	dmi_data[0x0C] != 0x01)
> |       		return;
> |
> |       	/* fwstr is the first 8byte string  */
> |       	strncpy(ec_fw_string, dmi_data + 0x0F, 8);
> 
> ... we shouldn't be using a C string api. Let's instead use memcpy() as
> this more properly relays the intended behavior.
> 
> Do note that ec_fw_string will still end up being NUL-terminated since
> we are memcpy'ing only 8 bytes into a buffer full of 18 zeroes. There's
> still some trailing NUL-bytes there. To ensure this behavior, let's add
> a BUILD_BUG_ON checking the length leaves space for at least one
> trailing NUL-byte.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>

This looks like the best choice given how this code is designed. The
"char *private" prototype is weird since there's only one user, but
okay. :P

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
