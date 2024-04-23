Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B998E136989
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Apr 2024 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713881200; cv=none; b=OcoObGYLb6t1VUuSgNTFnLt7QtI3u1mHDnisG4X+fYukMSBQvQvl3lEEkx8rE58GHqSfy8ncJ8KAVLLbrWH9MoW9ESvGFDTyHGh+5/7bqf8ATRLtdXx+5wc09n+IOERozH9bGfkclp43/VnhqCphsMjzMhkxD+h0L/lEXHLqykE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713881200; c=relaxed/simple;
	bh=YHMwetE9UgN0wUgwWaKAddtv6OOZID1l5KgqGyMw/1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KRzS2Zfqy+wOjpb6KIEU7B3gfFp9QwBJRwTGMSyP5F6WsygvR0ABiVbKter+TKJm0NHnyKP45Fqmd4w+FYX96hE+UEc6GUzK6TmnVf7wn8SwRnX7ShZWdRTjNu2a7yu718nQzM44CjV85jHo74xWiloMQAgBVcg/5W0+Eb8Epx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fT9ocq8l; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fT9ocq8l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713881197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k/l+y+K2e4ezW/S901NyeR+VzB703ZqkglgFfVI/Jf0=;
	b=fT9ocq8lcUzt45JpQ/o7pgxh1PGNpNQko+EFHC8abhKMBibg8kzn0ogWtNtbrTrsxkblaB
	bCkUdt02VG1n2ZCSUmXqlGT0mnB+FEYWLYC/bqtZREN5bqutmdqTtrMaJ598ksS6HpiHez
	FTfKcDF+/dstPMH9r6seSvtrt5U8niw=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-Xl7VMjc1P2ir6xu7jZ5qvQ-1; Tue, 23 Apr 2024 10:06:36 -0400
X-MC-Unique: Xl7VMjc1P2ir6xu7jZ5qvQ-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2d87f5937fcso49442691fa.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Apr 2024 07:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713881194; x=1714485994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k/l+y+K2e4ezW/S901NyeR+VzB703ZqkglgFfVI/Jf0=;
        b=wvz787TC5j/ToY2JhYdykGRsTKJxc3rhU7zIukKGSdaHos8xPVGAurv0ZXJsdCltuc
         Ijxbs4JYR6v839TeyGAv2o2XCS7jK4tlUtnsrSxWvROId8vDp9aReQMBgmpdgBb60yZK
         Xs4mB37mKdFvXN1gDCD6dB7CBozXt7uk0g8Ue8SLHOClldu6eFXlV6FqBqm7h333Fvdw
         hYbYeuXdo03AzwWICqnURAz9TNmUT4UVDleEsp6rjvYllokjSjjGuqfZbl2nDhLFMs1c
         S7ij5ox98xPwW5fx7+pyPahDPnKbJO0trBHkmSFwCNeW7vaM28q/5eS2uWjREAMzpZdF
         iKmw==
X-Forwarded-Encrypted: i=1; AJvYcCUCMDXi18fJaBqtVkMPOYfStRGDZuAkLglkDksHmCYHY9btsZb9YOET/DOLy67DmjGwpL8vq5Px/4QSoHqvshf7kqjh84OoA4SsQ/LmTdB3bkCBDQ==
X-Gm-Message-State: AOJu0Yxk0HEX4qEWh/4NAlCZMVpWrA8ZtbhyMCKCTj9XOXhU9NWukDHT
	fAMjG5C4rN5XnXTLi5gDKLnaZyFwx0XPhrVFqLdSiQ0Lv03IVZc+Awm5W5AKq7Pel9hXt6RCj+7
	d5Zg0nu1Qj38mcj+yGS5EI4UIB542Vs3HXDrQ+vP7aNd8Na88lxrNnHkOoLB98b0xwglVjLoBOp
	I1NUh+1A==
X-Received: by 2002:a2e:9b16:0:b0:2da:c37f:655e with SMTP id u22-20020a2e9b16000000b002dac37f655emr9224913lji.16.1713881194371;
        Tue, 23 Apr 2024 07:06:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU8R/1Q57Fv9g+4YH6U20goJVoKDtjYk7G+XMm3yCE7culi+P74zMjVzfgCbcxEx0d/0Ng+A==
X-Received: by 2002:a2e:9b16:0:b0:2da:c37f:655e with SMTP id u22-20020a2e9b16000000b002dac37f655emr9224891lji.16.1713881193940;
        Tue, 23 Apr 2024 07:06:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q23-20020a50c357000000b0056e672573e5sm6998546edb.88.2024.04.23.07.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 07:06:32 -0700 (PDT)
Message-ID: <451da24a-4d89-4af2-9c27-22e55f4016fe@redhat.com>
Date: Tue, 23 Apr 2024 16:06:31 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/24] platform/x86: thinkpad_acpi: Use correct keycodes
 for volume and brightness keys
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Vishnu Sankar <vishnuocv@gmail.com>, Nitin Joshi <njoshi1@lenovo.com>,
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
References: <20240421154520.37089-1-hdegoede@redhat.com>
 <20240421154520.37089-18-hdegoede@redhat.com>
 <CAHp75VeJaisUOt8DmVyNyEuHypkXYqBs4j3y+8EcinHt0L=TRQ@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VeJaisUOt8DmVyNyEuHypkXYqBs4j3y+8EcinHt0L=TRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 4/21/24 9:11 PM, Andy Shevchenko wrote:
> On Sun, Apr 21, 2024 at 6:45 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Change the default keymap to report the correct keycodes for the volume and
>> brightness keys. Reporting key events for these is already filtered out by
>> the hotkey_reserved_mask which masks these keys out of hotkey_user_mask at
>> initialization time, so there is no need to also map them to KEY_RESERVED.
>>
>> This avoids users, who want these to be reported, having to also remap
>> the keycodes on top of overriding hotkey_user_mask to report these
>> and Linux userspace has already been overridding the KEY_RESERVED mappings
> 
> overriding

Ack, fixed for v2.

> 
>> with the correct keycodes through udev/hwdb/60-keyboard.hwdb for years now.
>>
>> Also drop hotkey_unmap() it was only used to dynamically map the brightness
>> keys to KEY_RESERVED and after removing that it has no remaining users.
> 
> ...
> 
>> +               /* brightness: firmware always reacts to them.
>> +                * Suppressed by default through hotkey_reserved_mask.
>> +                */
> 
>> +               /* Thinklight: firmware always react to it.
>> +                * Suppressed by default through hotkey_reserved_mask.
>> +                */
> 
>>                 /* Volume: firmware always react to it and reprograms
>>                  * the built-in *extra* mixer.  Never map it to control
>> +                * another mixer by default.
>> +                * Suppressed by default through hotkey_reserved_mask.
>> +                */
> 
> Hmm... While at it, can we rectify the block comments to follow the
> standard style?
> (I meant those which you are touching here.)

Ack, but these get moved around in:

[PATCH 19/24] platform/x86: thinkpad_acpi: Switch to using sparse-keymap helpers

So to save my self some rebasing pain I will fix up the block comment style
there instead in v2 of the series :)

Regards,

Hans


