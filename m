Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A8535942
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Feb 2025 13:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740059256; cv=none; b=Ptpnd5XWHyILtj8q2yeKJICQiYuKD9Of8jyCpkQCsxTnfMOez3UWX2cqTqoGRuVVTg1F2nSAwOVDez6gzbRwbW0iXleZF/gwT8uCjLl//mqpnG4wUuP0S/d6wlvppP4rtqiAjQAgKCNJk2l/eEQMxNziz9TsNU83ww/DnAnQ8BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740059256; c=relaxed/simple;
	bh=jVK+H9hLPkOe9m0N8Ju2/UVAWcKelydk/mdy9ig4V50=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ecEjRKpI6BfUope+DNj6kbICW0h6s/Zt92W4w6zwq6oX5goFgbQVFccGbzvNsOLxbW/keDFPIRuhpFyMV682dMph+fUFuaOycn+ESW1SQcggl6Oz7BNqH5QL6zxBkftrdVHuM1AQnl+DyDa/fpkWWo3X4FrQqV8UPIOLkhrbHHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CsVRRaX0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CsVRRaX0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740059253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rzSmN3lJ8Wb11ghPtNE2hanshM2lxgoE/DuEE/FOTnI=;
	b=CsVRRaX079mcyC7z915QEg61s6mQw1esef0a3AqDQG/K5vvgfjesC6oy17u/5ZwtFZxObG
	six0kkI9JrXUM20WSKYgCQsyWic60xf0y+OPhykXRi58dUc5fDbRXdpyAupEiIROLPTIn2
	If3LTiM6RQPi4VCeYKrh9Ii/yJNTZLM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-S3Z_o0g3MbOG7v-QjF-gBA-1; Thu, 20 Feb 2025 08:47:31 -0500
X-MC-Unique: S3Z_o0g3MbOG7v-QjF-gBA-1
X-Mimecast-MFC-AGG-ID: S3Z_o0g3MbOG7v-QjF-gBA_1740059250
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aaf8396f65fso123373866b.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Feb 2025 05:47:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740059250; x=1740664050;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rzSmN3lJ8Wb11ghPtNE2hanshM2lxgoE/DuEE/FOTnI=;
        b=WChbzqqHa0h2E0iPb00oAUhlkW19PJxUzkCm72Zw3wrUMs1FUPt3UEdtZcFivav5ve
         gyzoGoXU1X1SknLNOf6rKEBoAkIy78XIvkXVE8zO4+6ZTWzxgmZ1057YaguI+EsbdIBh
         8HP7So9x7PjF/XVD5wyAm4sk13JdHVJD6NnBxGDCX9huXGKl8W3IMZ6ZMwavsYQbGMRM
         vBw0DVoMWu6QsegJkE1EJacLI2onWwTbrgh1t0m+lwj+4tvp963eBnaHMFEbdMUkxFJn
         owvKRqhkyRxD7bPZpPirO+ILXUt2WmcMID69vlJ83+6ljfSYOd1JrKBLjXjQH4RdBWH3
         tEfA==
X-Forwarded-Encrypted: i=1; AJvYcCW32UCqXIy+3OQK1mLXTcKoshLiYxRIcXgGXMkR5031g/N9H2SLfl+tyjdoqSv3w4Ea9jPZgcjev+VcSRme5Lg7cn/2@vger.kernel.org
X-Gm-Message-State: AOJu0YyqyjLcp4UzPcT3CjkN73DpLA1uWQ8Zpd7Zcshrxs/fm6QNNJMA
	nt/S9Oh1A/3chc2Q2BCcQBafVS1fuBWD7GbktplpczuW1ujKX98nJiNOOsSWnxTvudB56D4yaad
	K3psb3gU3jmw798humYuC2q6C4+l92HowyLvzOweIwkz/7mBviO+RgmXeMyUo59LG+CGBGk4=
X-Gm-Gg: ASbGncujYM5r8SzQw2XVyqwn3dhrThBWm6G0uIZ/zxbOqT5PkIQZWl+WnxBW3odkYFN
	UeI5gyCaP/KWYLpOUwc7fXUt7BmsR1tH4eAIJENoG69iIg7xzLkHYBdKU4PJ6xiu35V4Kq4LoHn
	dU3UTNXFlQ6UBoKsOBV+E+/EQQ1jCk/9UPiEnv6BRdepgv42EbioUhScge3fKAL3MS65/cvaIGR
	iJibIHIVf33PuvZtxjofXFXAlsvl+05AA1rKVkS39y3GZei+GJyrJucsGZ+8B9VWDzRTcFuKt7b
	L4x9pvMybc8Iu/54Ez0FHMCCkzxCcxpFfCcLzsPh1tzPc9BqRmQWQy5DgzZ2qHfxB9Vgre0KIRq
	0wIJsQ/ZtvZ182PTIln2ewCzJk0M1a5sFs2hIFMXdc44DZ8hvEHp5qfM=
X-Received: by 2002:a17:906:4794:b0:ab7:e52a:1467 with SMTP id a640c23a62f3a-abb70dad218mr2229433266b.30.1740059250129;
        Thu, 20 Feb 2025 05:47:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGtowFtNDCzriwbDKaufeHfVj4STh88vxR7DKNi6XgMq+u3Mmg8D66y1Loso7zNkXb4ZgY+g==
X-Received: by 2002:a17:906:4794:b0:ab7:e52a:1467 with SMTP id a640c23a62f3a-abb70dad218mr2229431966b.30.1740059249767;
        Thu, 20 Feb 2025 05:47:29 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb948b4978sm837678866b.151.2025.02.20.05.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 05:47:28 -0800 (PST)
Message-ID: <e0f47976-622f-4903-98a4-ace0317dada1@redhat.com>
Date: Thu, 20 Feb 2025 14:47:27 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: intel-hid: fix volume buttons on Microsoft Surface Go 4 tablet
To: Dmitry Panchenko | d-Systems <dmitry@d-systems.ee>,
 ilpo.jarvinen@linux.intel.co, platform-driver-x86@vger.kernel.org
References: <bea773df-9fd0-455e-87c9-d46f9d5b6feb@d-systems.ee>
 <c455b3c7-f408-4d7c-979f-83f07f94e845@d-systems.ee>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c455b3c7-f408-4d7c-979f-83f07f94e845@d-systems.ee>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 19-Feb-25 11:08 PM, Dmitry Panchenko | d-Systems wrote:
> Hello,
> 
> Volume buttons on Microsoft Surface Go 4 tablet didn't send any events. Adding Surface Go 4 to button_array_table fix this.
> 
> The patch is attached.
> 
> Signed-off-by: Dmitry Panchenko <dmitry@d-systems.ee>

Thank you for your patch. Unfortunately this is not in the correct format
for submitting patches. It is close though, good job for a first try.

To turn this into a proper patch, make the changes from your attached
patch to a git clone of a recent kernel tree (e.g, Linus Torvald's tree)
and then after making the changes do:

git commit -as

and for the commit message use:

"""
platform/x86: intel-hid: fix volume buttons on Microsoft Surface Go 4 tablet

Volume buttons on Microsoft Surface Go 4 tablet didn't send any events.
Add Surface Go 4 DMI match to button_array_table to fix this.

Signed-off-by: Dmitry Panchenko <dmitry@d-systems.ee>
"""

and then do:

git format-patch HEAD~

to get a 0001-xxxxxx.patch file, followed by:

git send-email 0001-xxxxxx.patch

to send an email.

Note this also requires that you first setup a ~/.gitconfig for your
name + email, as well as send-email config, e.g. I have:

"""
[user]
        name = Hans de Goede
        email = hdegoede@redhat.com

[sendemail]
        from = Hans de Goede <hdegoede@redhat.com>
        smtpserver = smtp.corp.redhat.com
"""

Or alternatively I can send a v2 patch for your putting things in
the right format.

Regards,

Hans


