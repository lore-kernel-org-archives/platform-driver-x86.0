Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2382F37C923
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 20:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788208666; cv=none; b=FyQKgSAJjUyQ2AWETpLPCguvyvlgmXi7Gxi3YLk+ioetTK0Ax+Fkr4P8vVth4NH/C8TgUP9lnXC3pjB8myDOXm1EML0WfK7CCxzgCel0//gSbDnl4FO3uyLiHTV6dY/bIQ3eSq3/eE8CPi/2268U80bOIq8qLqZ2wnmpTSTFGPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788208666; c=relaxed/simple;
	bh=luzcgfRYxds/VUPt/v/kVbv2QxFOf/KBARnFP1UiCTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c08hwM21wZEA3Ew0/Hdb675PKFaUt25MpPlV/MAhSEPvL62U+nZHPoK369PUfJmYiK5IWxaaTWPe2TbC+R9sbLqZFb93Lfx96qqWqnG6HgSK0N2ms7tNL1nFAFc34/Icj8guT4fnlq8vG+7NJOCZOB985bho/871TOlB5Pifu+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBcobuSo; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBcobuSo"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso291604a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 13:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788208662; x=1788813462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S0kQgsAl72FQNt3GLeFqPyaJ63mCAwOtZbt0gZ+AST0=;
        b=dBcobuSo68QEhygtfZ8w7/3UxJlF1dypPwXezf5ew9diDFfdzna+0tV+Sr9nB0XRwa
         dNORTx1S7i3ioneuxsl0vGaiS3Tg5nf0jRBzLinqo2kzEfq6QKfpWrVqlRaKpcKRwXpx
         wfZPLEX63QFq8uWZI4Oi2pTV2QDO0T6cyzvDXwt8x2refsHw4XvZOYoCAv4R8QbTpShQ
         iomLQZnnyLWwBEZ52QaIUioVKIZe1rbnTDi+dfwJHuSmwJqAKVqHaQl8tW+po9Cph2jz
         dE8NAA46vYSH8j9nXDCKSePzT9iMV4z0R1zayebcBrN0QVd5z1dIGM9VzocG3fIJzDMf
         9ovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788208662; x=1788813462;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0kQgsAl72FQNt3GLeFqPyaJ63mCAwOtZbt0gZ+AST0=;
        b=n8WhXZLzlVVqq6DG3uAP/3E2vuAYE9e2r2EFsYxc2n6yjOxT6k3JGTxUaCDNSMPSfO
         RgQaDIJtb4H9Pr1tj2yED1Idj9jsLmn6P0KNj05we1ZG1iBNVrq/Dp/bREwzBK646xuc
         FIOlblzJfKXSIy4om77ZneqcIAi6Ljz3VR672+KBLKK55KbIPD4HNGPSb1N5QYRUJcc4
         fe6rac8qA/betEmR3QJ1vuZfIpMBCKAwNXTqiejG/uwtmcR8K6lgNtATLM0etMRwBYZy
         u5MyjdWzk4RoVp+WzlJ9vQ83kHe9awET5V4tQ8A1MehvOvsUTnEfEi8Bd9PTthwI11qk
         LlAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2ERBRlIATm/Ihc7BeyyJGIBgep8NR0ka+lVQNt0yWFptosmK0OrOErAkwmipS4IYxGIt3bdtgvzmBP73od+VWTHiU@vger.kernel.org
X-Gm-Message-State: AFuF++ncp8JUmI229MulLRkQLxYg3BC9InRYTuCoTk3QrRtsJLhN/rw7
	hn+LwT5RcI2cjuoVxKP4Domg7D6Vj/ndTXvJjegnWGejq1n3URUKP5sf
X-Gm-Gg: AR+sD121Z/CN4ju/U0qjqrqCI4MRHpzJ8Ld3uIwqLbN0VvI/BMNDDe9h/tkx2sIocNM
	6dU8WiUlgvdRZZPwH8V2V8vzV7XZ6di56zpxK/ttMyilMnYFfBb3w+6bzLW196yL1v2Mu+NdLX7
	Mlsf/wPFE8aBWpYxh08dgpwQHheQbRshGcvXMGx4V5V7UizcG4Nj5O5hlROxS59ViB1mmXy+vVL
	LCRRBJ3SfqACfeIfaOTITtta2e43KPU2oCqs6aKgJT9uwwGlUByQdoYx7VEFEZI7blPYb2+D9JS
	MYyQ/gSStpc0J3WUdE9luiKo3UkSf4sAGljeBouxNHZHo3JNIeFSYprT91h6w12VeaVvH4YyQHj
	r4hwxigYmQeNswWwPnQQt+wThhEFalk4cSKyNvNs6znvKme7UAG46L8h9jRGM4foTWcfK3CaEZa
	XtrK29J/byQkGgOaeEupLPGpNs+cgCSTo32ylvgmNZIXjvwUSUGzoM5GgRoWh/EbJa+nzeQOj2V
	miH9Zn9TMGpFz/VKu9sNnuPDUKKog==
X-Received: by 2002:a05:6a20:3d82:b0:3c3:b57b:6285 with SMTP id adf61e73a8af0-3d26784f2edmr43303632637.13.1788208662147;
        Mon, 31 Aug 2026 13:37:42 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:15e9:e9f4:23e3:4f32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa400c8sm37185001eec.30.2026.08.31.13.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 13:37:40 -0700 (PDT)
Date: Mon, 31 Aug 2026 13:37:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] platform/x86: x86-android-tablets: fix Arizona and
 Crystal Cove GPIO lookups
Message-ID: <apXlqKuqhlBkSgpf@google.com>
References: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
 <5f5b802d-b0a4-493a-9816-e9bd91fd94df@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f5b802d-b0a4-493a-9816-e9bd91fd94df@kernel.org>

On Mon, Aug 31, 2026 at 10:17:41PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 30-Aug-26 13:15, Dmitry Torokhov wrote:
> > When gpiolib dropped name-against-label matching in favor of firmware node
> > identity mapping, lookups referencing unattached software nodes (such as
> > arizona and gpio_crystalcove in x86-android-tablets) stopped working.
> > 
> > This series fixes the lookups and cleans up redundant software node
> > registrations on Lenovo tablets:
> > - Point Arizona GPIO property entries directly to the codec device software
> >   node, which is attached to the parent device.
> > - Hold a device reference in gpio_secondary_fwnode_init() to ensure safety
> >   during devres action teardown.
> > - Generalize gpio_secondary_fwnode_init() to accept a node group argument
> >   and use it to attach crystalcove_gpiochip_node as a secondary firmware
> >   node to INT33FD:00 on Lenovo Yoga Tab 2 models.
> > - Drop redundant swnode group registrations on Lenovo Yoga Tab 3 and
> >   Yoga Tab 2 models where codec software nodes are already registered when
> >   attached to their respective devices.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> My initial testing report of success on the Yoga Tab 3 was a false negative
> caused by me still running the older kernel.
> 
> There was a generic bug in the new gpio_secondary_fwnode_init() helper
> which was causing all GPIO lookups for PROPERTY_ENTRY_GPIO() properties
> in the x86-android-tablets code to fail.
> 
> I've send out a patch fixing this:
> 
> https://lore.kernel.org/platform-driver-x86/20260831201157.36397-1-johannes.goede@oss.qualcomm.com/
> 
> Note that patch applies *on top of* this series.
> 
> With that patch everything works fine on both a "Yoga Tablet 2 1380" as
> well as on a "Yoga Tab 3" which covers all types of GPIOS (BYT SoC,
> CHT SoC, CrystalCove PMIC, Arizona codec) used in the x86-android-tablets
> code.
> 
> And the changes from this series look good to me too:
> 
> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com> # Yoga tab 2 1380, yt3
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Will you apply everything yourself or will you let Ilpo do this?

Thanks.

-- 
Dmitry
