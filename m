Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D367F381CF
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Mar 2024 11:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709550257; cv=none; b=DjYJj/UBTgFj+iwjO2Ci4uL5Q+dR5d61r6pkWokfByaNIfTVJx9M2BQkWdq8068R+LuAb7v/7H/07lTRAdU3a63fLn3jQCv+YTRdggQXMbu36juwRS0ATwRA7ujELjNnlH7TPtLgHJhxXLjxMCIQ2GauZ0AF7rU5PLvtuLDZSrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709550257; c=relaxed/simple;
	bh=TK1gwkvEd9biuHcUuPnJpv76wgaDpohb7mobbMLPKOA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZUyKvCWoRsd5rI5fFRGDR+BzSm/sc1Y8/yl/S7pnwQPHgA27Mt5sGeVvSW4VdAXtU5BtWsO+0bHIDYdlMs97HMT+jczZrmadsfgqju2i4XITW5xkvE99LXA1MyH010zjGQoEDABsXSS+qb49+XRBOVHzRrpGGH9MR+CPv6fYmeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a5YJDYnG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a5YJDYnG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709550254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zzxJ0yru8TqMJCIp9OdFabpl0sCZwuJ1t85KFtJIM4o=;
	b=a5YJDYnG1KCtgYEC1urPdR38mr9cbCjH/EFI+jzM6uinC8w7mdldu/WneJJHm5dfxtH6TG
	gAY+Ynj9707oaiwEpN8Fzo30ufS7CKn6sXR/MszgpQjf3qQxSNaLmFCUReQ/mKMQZ8V941
	S+9Jl8xqQ95OrkOLKnQNBpbkQ/vNGC8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-uj83r1GZNQymnu5lD4R1JA-1; Mon, 04 Mar 2024 06:04:13 -0500
X-MC-Unique: uj83r1GZNQymnu5lD4R1JA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a4533388b03so57640066b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Mar 2024 03:04:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709550252; x=1710155052;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zzxJ0yru8TqMJCIp9OdFabpl0sCZwuJ1t85KFtJIM4o=;
        b=KAF7LYnDxUCoi5JIyW1Pd6llqLOyD+24b1PUWE7Oj1EDwe1EirIQTr2ef4nzd5Pgxg
         wxcODT42X6IsnLYJ8YtFeMyjYNSaX0n7ejzEvXacjy0enpKMbHUy99BzQkULluUhlSfW
         u8WqpdCAUZHRgn4mapPwNa/dEqn6v5f6rmDoF4x9CI6c0ZWS2ICEJFEs3dqVTWwQ627M
         tKyuDe+vOp9rQZP7OkyqqOWgCZ3KbJMT9cTtDFlEZTzgWUDqqUIobA8aTCkii7EWxvHf
         kGEaGpjj/R3Pz0mg0Af6hVa4Kq/6H4f5/ZDL68N+xutQ1mGonOviBLsRTxFbIwnv2dEb
         IBhg==
X-Gm-Message-State: AOJu0Yx4z8hCukf38ekAfQhHHTOST83SdpyGYWbuesaWT98/4DIx47Kl
	Y8Tgc2L169a0FE/7T8ZF4M0dgqRCEmg7+kKbAS54HI/syz/IdAkgMlLeAXZ0z9LTWCbeOdkcxlF
	GTglO1sTInhANQAwB++5DwB4l6NZgan6yoFZtmSRGVEwxwzwg4v9Se4tbstpC7hltTJozmIY=
X-Received: by 2002:a17:906:2548:b0:a43:7ea2:a289 with SMTP id j8-20020a170906254800b00a437ea2a289mr5331261ejb.55.1709550252474;
        Mon, 04 Mar 2024 03:04:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXHb978WcCYhJEh2cwCWpfHOjRaBp80sEnLZIQhQ0DjnwO7+oXGnPp00Dg79VAvoM4uJ4jQg==
X-Received: by 2002:a17:906:2548:b0:a43:7ea2:a289 with SMTP id j8-20020a170906254800b00a437ea2a289mr5331250ejb.55.1709550252096;
        Mon, 04 Mar 2024 03:04:12 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id rp25-20020a170906d97900b00a3d665c6778sm4759957ejb.12.2024.03.04.03.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 03:04:11 -0800 (PST)
Message-ID: <d6a95bd9-dac2-4464-af84-9394a36b7090@redhat.com>
Date: Mon, 4 Mar 2024 12:04:10 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: p2sb: Defer P2SB device scan when P2SB
 device has func 0
From: Hans de Goede <hdegoede@redhat.com>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "danilrybakov249@gmail.com" <danilrybakov249@gmail.com>,
 Lukas Wunner <lukas@wunner.de>, Klara Modin <klarasmodin@gmail.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
References: <20240302012813.2011111-1-shinichiro.kawasaki@wdc.com>
 <gl7rsalwdwdo4rdes6akcnd7llrz75jjje2hchy5cdvzse6vei@367ddi3u6n2e>
 <a26554d3-bee9-4030-a06c-f886ba2fffb0@redhat.com>
 <r6ezdjqb5hz5jvvaj2beyulr2adwht2sonxw3bhcjdvwduyt66@2hlsmnppfsk2>
 <7935add6-a643-43dd-82a8-b7bcfb94d297@redhat.com>
 <6sbllfapnclmu5sjdtjcs4tyzkkr76ipg3i3rtqyyj7syhtkwd@d2l6zq2co7zt>
 <a5dac02b-c16a-45d1-8157-0dae1b034418@redhat.com>
Content-Language: en-US
In-Reply-To: <a5dac02b-c16a-45d1-8157-0dae1b034418@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shinichiro,

On 3/4/24 10:55 AM, Hans de Goede wrote:
> Hi,
> 
> On 3/4/24 4:19 AM, Shinichiro Kawasaki wrote:
>> On Mar 03, 2024 / 20:35, Hans de Goede wrote:

<snip>

>>> Also talking about making things more KISS, how
>>> about completely dropping the fs_initcall and
>>> simply always delay the caching of a devfn until
>>> the first call of p2sb_bar() for that devfn ?
>>>
>>> That way fixing the issue will also actually reduce /
>>> simplify the code :)
>>
>> This will simplify the code more, but it has two drawabacks:
>>
>> 1) It still leaves the rare deadlock scenario. If the drivers which call
>>    p2sb_bar() are not probed during boot, and if they are probed afterwards by
>>    sysfs pci bus rescan, pci_rescan_remove_lock causes the deadlock.
>>
>> 2) It triggers lockdep splat for pci_rescan_remove_lock at sysfs pci bus rescan,
>>    even for devices unrelated to p2sb (This is what I regularly observe during
>>    kernel tests for storage sub-system.)
>>
>> I suggest to limit these drawbacks only on goldmont.
> 
> I was not aware of the lockdep triggering issue. I agree that should be avoided
> when possible. I see you have kept the fs_initcall() for this in v3, good.

I have just taken a second look at my analysis of when p2sb_bar(devfn=0) is called
on Goldmont platforms and my analysis for:

1) edac/pnd2_edac             devfn = 0

was wrong, p2sb_bar(devfn=0) is only used on Denverton (aka "Goldmont D")
which uses the default P2SB_DEVFN_DEFAULT = PCI_DEVFN(31, 1) devfn not
the special Goldmont devfn.

So the p2sb_bar(devfn=0) call actually only happens on Goldmont from:

3) mfd/lpc_ich for pinctrl    devfn = 0

and then only when the ACPI tables fail to properly describe the GPIO
controllers as ACPI devices, if the GPIO controllers are described
in ACPI, which they are on the ASUS VivoBook D540NV-GQ065T then that
call gets skipped.

So on the ASUS VivoBook D540NV-GQ065T p2sb_bar(devfn=0) gets never
called. Which explains why not caching it fixes things. I assume that this
laptop just seems not likes the P2SB is touched at all and by not caching
the BAR for the P2SB it ends up not getting touched at all.

This also means that likely the P2SB devfn itself generally speaking is
often not touched on Goldmont platforms. So we can avoid the lockdep
issue on PCI bus rescan there by caching the SPI controller
PCI_DEVFN(13, 2) devfn from fs_initcall(), since that will be the only
devfn for which p2sb_bar() will get called (except on hw with the
GPIO controller missing from the ACPI tables which should be rare).

I have prepared a follow up patch to your v3 to cache the
SPI controller devfn instead of the P2SB devfn at fs_initcall()
time. I'll post this shortly and I'll also ask the bug reporter
to test the combination of our 2 patches.

Regards,

Hans

