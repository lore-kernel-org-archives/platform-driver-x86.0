Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1BF1B813
	for <platform-driver-x86@vger.kernel.org>; Sat,  5 Oct 2024 21:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728165566; cv=none; b=tb6PE2pgfZs+qo7fgoghAKHjGdmcA43s8FfZu1SvBY98QzfOLxeAn7zxFLV/3ovvm19iY6cX+zu44CSl1n98+aeY1e1CtACFPP3ny6XIqURpvIUnhLEUmJKNXavetximDoxNSTnr+pm2c+hPyC3gTe+459ICCE2kPfxKA+3MyOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728165566; c=relaxed/simple;
	bh=sWQi9H5xY09crbHKGVuXJ9U7RvLAiaYRnNzeBWnyDfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sJEmLhuQiIga8UTaPhJQfZJSq3ZUxF+VMHJ+qiyxmUlpcU8fIEeD9qEDtGeyzaSS28BddK0ggb2hWyWgVmcqBdj8fvMPbTaYVRr+NS1BdTwMzmPNJows1Knix23x2mceKhUrScgTnxWXbUt2qHxRJzhnwhUziBrTNBjL0rloavo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nfk1dpWn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nfk1dpWn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728165563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X+2qFgJpzwc7r4fjjgneGNErmd7l+84a50BAtN5oZcc=;
	b=Nfk1dpWnLcfEs6eNfbSB5cbBzQBeafdUbe3i6QyATOVn1vPvjFpD4puELjp+09IVaD/CqW
	BZjKGIvIKI5KMljL+fE7kLREiP6K+jmUsOVrTr89z2nszzoRbExgmwwxGnoTQCUZD/9vTM
	5v6JqDHDU3o6nWpkNflarNOUheMUX64=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-fqID8vYJP7OKNKl5voD2YQ-1; Sat, 05 Oct 2024 17:59:22 -0400
X-MC-Unique: fqID8vYJP7OKNKl5voD2YQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a8a8308cceaso467262066b.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 05 Oct 2024 14:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728165561; x=1728770361;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X+2qFgJpzwc7r4fjjgneGNErmd7l+84a50BAtN5oZcc=;
        b=RDzavvSoMQdf7GL+yfSlflZaXu/1VRaFQQwB436TE1lexDAO7ArN0gEXfT9xaGqet4
         o0p8QBZ3bnD8i6vdHc/OIn1zCs/w9AL/uyaHN9IX5XWjnX1cyru6DF7QJEp36zqy/LYY
         8OxAwUemPFrpzImy7ugMMguZlZ2w72XGu8iltuJlrmoOatAkeia/XuUvMLWYHIxYKvcR
         o/x0Adbo1+7Z57M2qsbtKNTuVX7Rc3M/c6f6utqX61lspxiiVlpzM5S4DCB/MdNmcaFa
         KD/MLkxPpcfSehxA+VosQkhCNxwtD6qaUUICKwGYxHpb+hV9iyhfef+vnhygdAZ10nKl
         YGOA==
X-Gm-Message-State: AOJu0Yy2+7OV2CS/c6ZBpjsfMjPIZ+bqqGG0V1MmuWf6YTrFux1di9Et
	mXrE7ue4Ak5x+sULeKJ2RQlQ1ZgXURzLdxG5R7M43YmmbDbt3fuG1XGrDwwmHI6oZtRocUuudTT
	hVlsunLssEP6TLGWS5ELoA1T2E9xjUmtjoHN4dPjrXQlYziQh3beenZZzKRxv1fHi6nXlvmw=
X-Received: by 2002:a17:907:841:b0:a99:4d0c:821e with SMTP id a640c23a62f3a-a994d0c8677mr12489866b.24.1728165560960;
        Sat, 05 Oct 2024 14:59:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdZaLgeTMW0Q9ovqdUtwF3Ao5qKKQfYYu9MiQGv2vWO7r/n3G3C7Bdy1d6+hgQ9ndvMexvgw==
X-Received: by 2002:a17:907:841:b0:a99:4d0c:821e with SMTP id a640c23a62f3a-a994d0c8677mr12488566b.24.1728165560521;
        Sat, 05 Oct 2024 14:59:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a992e7b24e9sm178389566b.156.2024.10.05.14.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2024 14:59:20 -0700 (PDT)
Message-ID: <0ce10896-6246-411c-b01e-54d02ec7a76b@redhat.com>
Date: Sat, 5 Oct 2024 23:59:18 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] platfom/x86: asus-wmi: revert ROG Ally quirks
To: Luke Jones <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 corentin.chary@gmail.com, Mario Limonciello <superm1@kernel.org>
References: <20240926095344.1291013-1-luke@ljones.dev>
 <5c21455c-c688-4287-a4ad-d047efa180eb@redhat.com>
 <e8107624-cb9c-4eaf-9760-073424b38b3c@app.fastmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e8107624-cb9c-4eaf-9760-073424b38b3c@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Luke,

On 5-Oct-24 9:48 PM, Luke Jones wrote:
> Hi Hans,
> 
> On Sun, 6 Oct 2024, at 3:37 AM, Hans de Goede wrote:
>> Hi Luke,
>>
>> On 26-Sep-24 11:53 AM, Luke D. Jones wrote:
>>> The ASUS ROG Ally (and Ally X) quirks that I added over the last year
>>> are not required. I worked with ASUS to pinpoint the exact cause of
>>> the original issue (MCU USB dev missing every second resume) and the
>>> result is a new MCU firmware which will be released on approx 16/10/24.
>>
>> First of all let me say that it is great that you have gotten Asus
>> to come up with a fixed firmware, thank you.
>>
>> With that said I believe that it is way too early to revert these quirks,
>> users are usually not great at installing BIOS updates and that assumes
>> this will be handled as part of a BIOS update, if it requires running
>> a separate tool then the chances of users not installing the update
>> will likely be even worse.
>>
>> So IMHO for now we should keep these quirks around to avoid regressions
>> for users who don't have the MCU update.
> 
> I wasn't sure how best to handle it, mostly the intention was to publicise things. In any case the quirks don't affect the new FW update at all and most folks won't ever notice.

I think we can look at dropping the quirks in maybe a year from now
or some such. Doing it right now feels like a bit to quick after
the fw fix.

And as mentioned elsewhere in the thread, if possible it would be
good if some other driver. e.g. hid-asus could check the FW version
and log a warning if the old version is still found.

>> Related, have you seen this series:
>>
>> https://lore.kernel.org/platform-driver-x86/20240922172258.48435-1-lkml@antheas.dev/
>>
>> that seems to fix the same issue ?
> 
> The history of that is here https://lore.kernel.org/linux-pm/20240919171952.403745-1-lkml@antheas.dev/#t
> 
>> And it does so in another, arguably better way.
> 
> It is a variation of the many many things I've tried while building a comprehensive set of data for ASUS to work with. You can achieve a similar thing with only s2idle_pm callbacks and Mario's patches to export the DSM screen-off as an external symbol. Better is subjective since it still fails to fix the initial reason this work ever started - fixing the Ally - unless delays are added.
> 
>> Although unfortunately as patch 3/5 shows just calling the global
>> "display off" callback before suspending devices is not enough
>> fixing things still requires inserting a sleep using a DMI quirk :|
> 
> This is because the issue can only be fully fixed in FW. What is happening here is just another variation of the quirk and the things I mentioned above. It gets worse with different compiler such as clang, or different kernel config, or even distro. The cause of issues is that a particular signal the MCU is waiting on may not occur and that becomes wildly unpredictable depending on kernel config, compiler etc.
> 
> Even Windows can have the issue we have here.
> 
>> Still that series including the DMI quirk might be a cleaner way
>> to deal with this and if that is merged then dropping the quirks
>> from asus-wmi makes sense.
> 
> All of this is fully negated by the coming firmware. Having said that, *if* there are any issues with these patches then those issues will never come to light with the new MCU FW either as it fixes the root cause of the issues seen.

That sounds great, once more thank you for working with Asus to
properly fix this.

> The mentioned patches achieve a similar result to using Mario's s2idle callback patches and using those in s2idle_pm_ops. But as seen above, the timing issue becomes apparent - and this is fixed only by using fixed FW.

Right. As I mentioned already in the other thread I am having second
doubts about moving the LPS0 display power off call to before devices
are suspended, doing so would mean that the display might still be on
when that call is made and that call could disable power-resources which
are necessary for the display causing issues when the display driver's
suspend method runs.

So I think that we need something closer to Mario's original POC from:

https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git/log/?h=superm1/dsm-screen-on-off

if we want to make the suspend order more like Windows and make
the LPS0 display off call when the last display is turned off.

And as you have explained making the suspend order more like Windows
is unrelated to the real cause for the ROG Ally MCU suspend issue,
so lets continue any discussion about suspend ordering in the other
thread.

Regards,

Hans



