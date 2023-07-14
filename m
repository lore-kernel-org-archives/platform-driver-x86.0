Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB8CEB64DC
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Jul 2023 17:01:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235235AbjGNRBr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Jul 2023 13:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235993AbjGNRBb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Jul 2023 13:01:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87FBB1FC8
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 10:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689354043;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=N02ki8uvE+pJy/IlL5vbiclYkSO78Gu5qwE7U3vocZo=;
        b=OiEs3+VaZ7ogiMhwOBDK3ae86WtJXYElQ7AN54R0FHZ2vdqNYtgkhJcoQjyNVyxm8V6Z24
        MvfIuP1dt0qXwTb89yV/oxoS2mcS6PKZe9Jo5zzldG+M1NThxMLS9yXcCdVGUwizBpDzTk
        pfk52dL8+nYQnnofpr61VeMb1VNecG8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-ReBMh1tHOiiSbphqofZHZw-1; Fri, 14 Jul 2023 13:00:23 -0400
X-MC-Unique: ReBMh1tHOiiSbphqofZHZw-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-51e278a3a2dso1178561a12.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 10:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689354015; x=1691946015;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N02ki8uvE+pJy/IlL5vbiclYkSO78Gu5qwE7U3vocZo=;
        b=gn52q74kgEw3rRsB90xMl/MWoMolYrBJgWtcB4OlVJ/hO8mbiHp+WsD0S6AhNZitrs
         A4mI2aMen8+CG8lbNVVp8YdvIQOTHsdFxHkiIG2n22rsG6bVXtYAokZrHAzZEp+LCgmC
         U5qYa/TJ0nugULvB782TMNq8Zbj1irtz1ci3f5ESx9Uv2kh3nFExE2xpVJl+b2cXDjvG
         N9Qsnv8am61/HtgSh7uoYOnGNzg6AdmhTLQ/B0E9/tsu+3TNr7vHuspBnPIEQxnkB6Mn
         Dm0yI1N8ElbExx27XgM+IKRLgmIXrFcEN+rgL+JtpdjIMNI4oI2GykElc6cjgOEwT7mp
         9daA==
X-Gm-Message-State: ABy/qLa7UVuauGbECDwesF+swC3sQ0AAIqjjgs9MsKXQMXFjD/BPCRYf
        HtNWsCPBad1RLnl4EVQzvTU+vYnyLjqu+pCbSini9Rxub0IdGSgP8VnIRHc3waxoPdlRUMeF5Eg
        LKuWgDvhFMgBEWN54BDpun1kRvPic3LiMpA==
X-Received: by 2002:aa7:cd16:0:b0:51b:c714:a2a1 with SMTP id b22-20020aa7cd16000000b0051bc714a2a1mr4919600edw.7.1689354014959;
        Fri, 14 Jul 2023 10:00:14 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGHSotZVQrG7OiZfkMB68lmfzqaugn4uggppG/vYjJ0LbWV4JTr3t/Gno0oIURvY09bBN+QQA==
X-Received: by 2002:aa7:cd16:0:b0:51b:c714:a2a1 with SMTP id b22-20020aa7cd16000000b0051bc714a2a1mr4919581edw.7.1689354014596;
        Fri, 14 Jul 2023 10:00:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id w24-20020aa7cb58000000b0051e0f8aac74sm6010017edt.8.2023.07.14.10.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 10:00:14 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------wXV3NyKm5Y3zQIfoH2wA27S0"
Message-ID: <4b7da537-8ec3-95e2-4053-871c56e980ea@redhat.com>
Date:   Fri, 14 Jul 2023 19:00:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] platform/x86/intel/hid: Add HP Dragonfly G2 to DMI quirks
Content-Language: en-US, nl
To:     Maxim Mikityanskiy <maxtram95@gmail.com>,
        Alex Hung <alexhung@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Richard Hughes <hughsient@gmail.com>,
        Jorge Lopez <jorge.lopez2@hp.com>
References: <20230712175023.31651-1-maxtram95@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230712175023.31651-1-maxtram95@gmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This is a multi-part message in MIME format.
--------------wXV3NyKm5Y3zQIfoH2wA27S0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Maxim,

On 7/12/23 19:50, Maxim Mikityanskiy wrote:
> SW_TABLET_MODE reports are broken on BIOS versions newer than 1.9.1 on
> HP Elite Dragonfly G2. Analysis of SSDT9 shows that the BTNL method has
> to be called to start getting 0xcc and 0xcd events. Apparently, the
> button_array_present method used to return true on BIOS 1.9.1 and older,
> but it returns false on newer BIOSes due to HEBC returning 0x000033f3
> (bits 0x60000 and 0x20000 are not set).
> 
> Add this laptop to button_array_table to force the BTNL call, and also
> add it to dmi_vgbs_allow_list to read the initial state and sync VBDS
> with VBPS, because this laptop has a reliable VGBS method.
> 
> Tested with BIOS 1.13.1.
> 
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>

Thank you for figuring this out and thank you for the patch.

WRT the need to call BTNL, I expect that if one laptop needs this likely more models will need it and I expect / hope that this will not cause any issues when called everywhere.

So I think it would be better to instead of adding this model to the button_array_table[] it would be better to just always call BTNL (I suspect this is also what Windows does).

Can you give the attached path to always call BTNL a try ?

As for adding the model to dmi_vgbs_allow_list[] on many models it seems that the EC will send a 0xcc / 0xcd event at boot (now that I think about it I guess this may be in response to the BTNL call) and then on that event the SW_TABLET_STATE evdev gets registered and the first event also syncs the state.

Can you check if just using the always call BTNL patch, without the quirk perhaps already makes the SW_TABLET_STATE evdev show up (including the correct state) ?

If no event is send during boot, the n I'm fine with adding the model to the dmi_vgbs_allow_list[], but perhaps this is not necessary?

Regards,

Hans



> ---
>  drivers/platform/x86/intel/hid.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
> index 5632bd3c534a..5c78b476ed1e 100644
> --- a/drivers/platform/x86/intel/hid.c
> +++ b/drivers/platform/x86/intel/hid.c
> @@ -128,6 +128,13 @@ static const struct dmi_system_id button_array_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Surface Go 3"),
>  		},
>  	},
> +	{
> +		.ident = "HP Elite Dragonfly G2",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "HP Elite Dragonfly G2 Notebook PC"),
> +		},
> +	},
>  	{ }
>  };
>  
> @@ -150,6 +157,12 @@ static const struct dmi_system_id dmi_vgbs_allow_list[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Surface Go"),
>  		},
>  	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "HP Elite Dragonfly G2 Notebook PC"),
> +		},
> +	},
>  	{ }
>  };
>  

--------------wXV3NyKm5Y3zQIfoH2wA27S0
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-platform-x86-intel-hid-Always-call-BTNL-ACPI-method.patch"
Content-Disposition: attachment;
 filename*0="0001-platform-x86-intel-hid-Always-call-BTNL-ACPI-method.pat";
 filename*1="ch"
Content-Transfer-Encoding: base64

RnJvbSAxZmI0NDNjYjFjYWY3M2U5NDBhNmIwNTUwYjdlNzljODZlZGYzYWVmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBGcmksIDE0IEp1bCAyMDIzIDE3OjUxOjM4ICswMjAwClN1YmplY3Q6IFtQ
QVRDSF0gcGxhdGZvcm0veDg2OiBpbnRlbDogaGlkOiBBbHdheXMgY2FsbCBCVE5MIEFDUEkg
bWV0aG9kCgpPbiBhIEhQIEVsaXRlIERyYWdvbmZseSBHMiB0aGUgMHhjYyBhbmQgMHhjZCBl
dmVudHMgZm9yIFNXX1RBQkxFVF9NT0RFCmFyZSBvbmx5IHNlbmQgYWZ0ZXIgdGhlIEJUTkwg
QUNQSSBtZXRob2QgaGFzIGJlZW4gY2FsbGVkLgoKTGlrZWx5IG1vcmUgZGV2aWNlcyBuZWVk
IHRoaXMsIHNvIG1ha2UgdGhlIEJUTkwgQUNQSSBtZXRob2QgdW5jb25kaXRpb25hbAppbnN0
ZWFkIG9mIG9ubHkgZG9pbmcgaXQgb24gZGV2aWNlcyB3aXRoIGEgNSBidXR0b24gYXJyYXku
CgpOb3RlIHRoaXMgYWxzbyBtYWtlcyB0aGUgaW50ZWxfYnV0dG9uX2FycmF5X2VuYWJsZSgp
IGNhbGwgaW4gcHJvYmUoKQp1bmNvbmRpdGlvbmFsLCB0aGF0IGZ1bmN0aW9uIGRvZXMgaXRz
IG93biBwcml2LT5hcnJheSBjaGVjay4gVGhpcyBtYWtlcwp0aGUgaW50ZWxfYnV0dG9uX2Fy
cmF5X2VuYWJsZSgpIGNhbGwgaW4gcHJvYmUoKSBjb25zaXN0ZW50IHdpdGggdGhlIGNhbGxz
CmRvbmUgb24gc3VzcGVuZC9yZXN1bWUgd2hpY2ggYWxzbyByZWx5IG9uIHRoZSBwcml2LT5h
cnJheSBjaGVjayBpbnNpZGUKdGhlIGZ1bmN0aW9uLgoKUmVwb3J0ZWQtYnk6IE1heGltIE1p
a2l0eWFuc2tpeSA8bWF4dHJhbTk1QGdtYWlsLmNvbT4KQ2xvc2VzOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9wbGF0Zm9ybS1kcml2ZXIteDg2LzIwMjMwNzEyMTc1MDIzLjMxNjUxLTEt
bWF4dHJhbTk1QGdtYWlsLmNvbS8KU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRl
Z29lZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9oaWQu
YyB8IDIxICsrKysrKysrKy0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9y
bS94ODYvaW50ZWwvaGlkLmMgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9oaWQuYwpp
bmRleCA1NjMyYmQzYzUzNGEuLjY0MWYyNzk3NDA2ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9w
bGF0Zm9ybS94ODYvaW50ZWwvaGlkLmMKKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50
ZWwvaGlkLmMKQEAgLTYyMCw3ICs2MjAsNyBAQCBzdGF0aWMgYm9vbCBidXR0b25fYXJyYXlf
cHJlc2VudChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXZpY2UpCiBzdGF0aWMgaW50IGlu
dGVsX2hpZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXZpY2UpCiB7CiAJYWNw
aV9oYW5kbGUgaGFuZGxlID0gQUNQSV9IQU5ETEUoJmRldmljZS0+ZGV2KTsKLQl1bnNpZ25l
ZCBsb25nIGxvbmcgbW9kZTsKKwl1bnNpZ25lZCBsb25nIGxvbmcgbW9kZSwgZHVtbXk7CiAJ
c3RydWN0IGludGVsX2hpZF9wcml2ICpwcml2OwogCWFjcGlfc3RhdHVzIHN0YXR1czsKIAlp
bnQgZXJyOwpAQCAtNjkyLDE4ICs2OTIsMTUgQEAgc3RhdGljIGludCBpbnRlbF9oaWRfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2aWNlKQogCWlmIChlcnIpCiAJCWdvdG8g
ZXJyX3JlbW92ZV9ub3RpZnk7CiAKLQlpZiAocHJpdi0+YXJyYXkpIHsKLQkJdW5zaWduZWQg
bG9uZyBsb25nIGR1bW15OworCWludGVsX2J1dHRvbl9hcnJheV9lbmFibGUoJmRldmljZS0+
ZGV2LCB0cnVlKTsKIAotCQlpbnRlbF9idXR0b25fYXJyYXlfZW5hYmxlKCZkZXZpY2UtPmRl
diwgdHJ1ZSk7Ci0KLQkJLyogQ2FsbCBidXR0b24gbG9hZCBtZXRob2QgdG8gZW5hYmxlIEhJ
RCBwb3dlciBidXR0b24gKi8KLQkJaWYgKCFpbnRlbF9oaWRfZXZhbHVhdGVfbWV0aG9kKGhh
bmRsZSwgSU5URUxfSElEX0RTTV9CVE5MX0ZOLAotCQkJCQkgICAgICAgJmR1bW15KSkgewot
CQkJZGV2X3dhcm4oJmRldmljZS0+ZGV2LAotCQkJCSAiZmFpbGVkIHRvIGVuYWJsZSBISUQg
cG93ZXIgYnV0dG9uXG4iKTsKLQkJfQotCX0KKwkvKgorCSAqIENhbGwgYnV0dG9uIGxvYWQg
bWV0aG9kIHRvIGVuYWJsZSBISUQgcG93ZXIgYnV0dG9uCisJICogQWx3YXlzIGRvIHRoaXMg
c2luY2UgaXQgYWN0aXZhdGVzIGV2ZW50cyBvbiBzb21lIGRldmljZXMgd2l0aG91dAorCSAq
IGEgYnV0dG9uIGFycmF5IHRvby4KKwkgKi8KKwlpZiAoIWludGVsX2hpZF9ldmFsdWF0ZV9t
ZXRob2QoaGFuZGxlLCBJTlRFTF9ISURfRFNNX0JUTkxfRk4sICZkdW1teSkpCisJCWRldl93
YXJuKCZkZXZpY2UtPmRldiwgImZhaWxlZCB0byBlbmFibGUgSElEIHBvd2VyIGJ1dHRvblxu
Iik7CiAKIAlkZXZpY2VfaW5pdF93YWtldXAoJmRldmljZS0+ZGV2LCB0cnVlKTsKIAkvKgot
LSAKMi40MS4wCgo=

--------------wXV3NyKm5Y3zQIfoH2wA27S0--

