Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F56A186E30
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 20:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723494596; cv=none; b=R4RdcnQVyeHa0ydmI2TPgwZ+GvVkVO8i58EtbR2tWnjqRsBzl6SZaS+fMoVK9qOHPfCa1RTEYBy5dtA271WeIbHNpjitXIhgZESPVj7muVJoWXYg8IahFHfRRjQdut2CJUrEAJFhqdfZhR6yqRnWLm4UZf3dITcVf2hwdVcL4+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723494596; c=relaxed/simple;
	bh=pf+ktuKe6yndXVSiyKzPfLnyVeQbtCQ9dUbM659PrPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tvMC2RtIc8j5uTwK2SNssdnfepvXNwWNmaJWkcb6t+fsZfy+Oy8SxjbkKUz+tXA/1SZA6KFApepXs9/KQ//O7p7EiOj4qyYuRhgRb39UQ4QdPHtg7XjT9cjdMJz+koNUTac6MeiW2QSIzhYxKTXAADFX4KSQFd83BPX1c2/CxZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X8qjJvMp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X8qjJvMp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723494593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tUaqQe7VIC+I8eEVAhRZO/TcbSTWzoFhRqLL72GaM+o=;
	b=X8qjJvMpfVDK9JiQC8+AfXW6diA2OiW5Sx9oKcNlT/FvSGrlEXM24zVbXb8TL2AxcuQyrx
	ONVte8dJYB5K2UEJ7zNk2PVoJcjG/kghNquR+v5yIrTvPb/xIgoOlHQ2psGsqiX49MthwL
	mEwuhl0soh/q/mlXQtpDK3nPK9gnaRA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-s4h97w_lPleKgO3DSKgM_w-1; Mon, 12 Aug 2024 16:29:52 -0400
X-MC-Unique: s4h97w_lPleKgO3DSKgM_w-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3688010b3bfso3102363f8f.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 13:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723494591; x=1724099391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tUaqQe7VIC+I8eEVAhRZO/TcbSTWzoFhRqLL72GaM+o=;
        b=qlu8ySbMch5Nx5pkzvOJ6dGonV68lKoCGxaHLTAFitcNEpgf94iqEhhyeQja0w7fCr
         I66F3kzkBuvPO4FSt8GVB5q98vtZ2/IcG+g1Ji4FZadwo3u6TKcss353g0lWq0IfMMMP
         lmYs52O7dPoMVJA83i7YdxCzpW3RbmbtuFsGFQY+2ZGOk/vCu1Wv6sdweXA4mCysjmQV
         QZTbt/aLGbWRVrvgohSxGe+3cnMjrIJhPSZNJytu0Vl0MGsP3pPPV9PeIn8MBzvxeQ6z
         Na9FDTi3rtBLgUNTlo/NSVtW3raQiSutMbapEDlGmSdACJq16zwEqioF1WbisrS9jXLu
         OT1w==
X-Forwarded-Encrypted: i=1; AJvYcCUO2vjPVwzG4Puyc5wR8NSe41QnyyDAnynXW3bSDEdX4fWOCEKppt5QM6/qhEDDYEw2CzDpytadim3UhlbRa+RovhR5IptGRtSBXaRh4nsf8UsUoQ==
X-Gm-Message-State: AOJu0Yzxvy8dTtt+YkzZnRuLX9xfNzzudkejnVuYTzDPTaLgTAqShVNe
	/h3VbNMH/VChwHnbHjOUeY0SNEgywDVbzoJQ/sqOR7HpluSUL4Fbd9s+vn0/yBd7Pz++MyR6oyc
	yA/IDEGZBCYq4ifp/OueCop41w1QXs7Qx/kUKIA8isXTZmFQaqlcUynwVrrKWhBP28Oe1kcU=
X-Received: by 2002:adf:e5d2:0:b0:36b:a40c:5c09 with SMTP id ffacd0b85a97d-3716cd25538mr1214821f8f.58.1723494591083;
        Mon, 12 Aug 2024 13:29:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa8vz78wT00LpPlQZInfPcRGMZGNhaXerYWBNEqb9jRLedY0fGrt0tPET02YnfSFJp9XYKiw==
X-Received: by 2002:adf:e5d2:0:b0:36b:a40c:5c09 with SMTP id ffacd0b85a97d-3716cd25538mr1214795f8f.58.1723494590443;
        Mon, 12 Aug 2024 13:29:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f4183aa5sm7639866b.211.2024.08.12.13.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 13:29:50 -0700 (PDT)
Message-ID: <5254053d-d8a7-48a2-aa7d-af53ce7b1a2b@redhat.com>
Date: Mon, 12 Aug 2024 22:29:49 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
 eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
 Dell.Client.Kernel@dell.com, Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240805133708.160737-1-hdegoede@redhat.com>
 <20240805133708.160737-5-hdegoede@redhat.com>
 <CAHp75VeCVCqmG0Px8_EyztS6ZeBbhU0Nbtru5mkQxKNeR6pynQ@mail.gmail.com>
 <3a4f4c6c-3069-412e-9c71-b4e0308fccd4@redhat.com>
 <ZrpATebaOpSJyBca@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZrpATebaOpSJyBca@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8/12/24 7:03 PM, Andy Shevchenko wrote:
> On Mon, Aug 12, 2024 at 06:00:20PM +0200, Hans de Goede wrote:
>> On 8/5/24 10:48 PM, Andy Shevchenko wrote:
>>> On Mon, Aug 5, 2024 at 3:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>>>> +       bus_for_each_dev(&i2c_bus_type, NULL, &adap, find_i801);
>>>> +       if (!adap)
>>>> +               return;
>>>
>>> May i2c_for_each_dev() be used here?
>>
>> The main difference between i2c_for_each_dev() and
>> bus_for_each_dev() is that i2c_for_each_dev() holds
>> the i2c core mutex while it is calling the passed
>> in callback.
>>
>> And find_i801() calls i2c_get_adapter() which also
>> takes the i2c core mutex, so i2c_for_each_dev()
>> cannot be used here since then things deadlock.
> 
> + A comment to prevent "clever" cleanupers from breaking the things?

Ack, good idea, added for v8.

Regards,

Hans

