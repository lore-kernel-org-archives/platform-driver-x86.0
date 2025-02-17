Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33B622B5A3
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Feb 2025 18:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739815862; cv=none; b=WGDRKxjfCI9qIhRhqR8m3MUBIqjVMoiJNZsb3XLjsPLsSI11Xt1yz5KK4LQmGDs403I4auJw2ssAMr2vliKq0ohSgwTV50UdX0XDJmUVgran3g6D1Xc24wPTi4lmbjBS7sdB8/SLrIoEOYjeK0eoUvFzOPPf1iBC+0EO19UYWVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739815862; c=relaxed/simple;
	bh=+LVuhMm4/4IRWnEOXMkAQzqq62/PlHDeymErvUeBidk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AQWohsOhE9BSjZtVqnQTJlaDHcZaj1gCwTTd7ExwhP7nyzVOe3Dwh/Mw4nSVHii5Y2AtUgWC1WCPGmmAa25La+uH9tT8QBh8oMIW4ULYFYVQmQu1G/VOifKdrHaxriG+90IssMqmpn66ekOFxSNdoBWw+yJhXwRAWzCr+wZLZG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=h9Q9Ldcv; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="h9Q9Ldcv"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38f3ee8a119so906985f8f.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Feb 2025 10:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739815858; x=1740420658; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WYdQMpmWfwfRPZrNOq/JI6U8Fyr73ByGTD+9Af1nU7I=;
        b=h9Q9LdcvKJavN/GMUzW7WoMBUj9hTQJkk6CNQ25jgzMyqIbEpobg08+aZqKeuJGovz
         ci0Rf3Epyn59Xo0hYLEbCMF5drcL/2u+Misdyw3PIIRNMkqSacU/YWvag6kJqfo25RGA
         sOZnQ7QjLyKGg67A3GqD/tYAjCRiGA+2Mb7QpUCN1sMBNT75BlR1i5Vo0GowlhkoCOpJ
         LpvymOZwvGsxWaMsn9HwRatf63LNma+EjSfTKmcJ2P6o6zp0VjftAkLR3H9YbgXxOUnz
         DgdDq2+WdFSs5lUDhIrGmolWKJjxTm1DkGn0IMeBaWcVXaL0LsqqAXNjvqgQRu4+HZEX
         FUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739815858; x=1740420658;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYdQMpmWfwfRPZrNOq/JI6U8Fyr73ByGTD+9Af1nU7I=;
        b=CXuGfNmvzgWjuATIq8Avc5h49myXnayqNBSkW1d4KoXWBQHIJpnI26c8gVuT+Sphm6
         vr6nh8Vu77B7doCA0mkgn9mK1+j7mWEN77JE9VlrU9QZmfrZWRjcW1jWKGOxrhXlpZTJ
         NTFItwEwiUBDwXtHBwlmg3QCC1XlfoFm/TaVGXGwpEDASKg+6nke0jxvMG6FAePT7vzo
         OPwZZAEYGl1AYGqm/VoiWwfVVQgih/2epWVUqKuL1NBtVPVC3vhgJht4tu8O1RtHMmiz
         XEV/HU/AZPZjYxIQf3ubAv6HT4veyDJgtPN0oRpMhwWjirEndPoFSLsbo3yCyZ1eOUve
         /E+A==
X-Forwarded-Encrypted: i=1; AJvYcCWHqIsq04X4HfxPP362VdQNJi6OCUBm92ZlrqYWsSpVcdecvK4H0xvEK95yj64UPwz3pQ8UPR4yqDqFweO0KBlpaafT@vger.kernel.org
X-Gm-Message-State: AOJu0YwFw27Loybah/To+Ycr9OtIYJRm2UQSBJPZzeTuzxnp8rcN+eLP
	WrpcArg/hpj6WgBsM5yqZuXgyDOox95+plNgMMugeFxc7j7D7bCgcJnaUmp1p0g=
X-Gm-Gg: ASbGncvjkLbwjQ3we+VVoS4ZkUyNsOEtYJg36san4U29DiwK8N7Fd9vNmo4erNkpk1h
	5upo274N3qOGRYG/92SjrNn7bsLbG9BZy0bjGQ3yzXwwz91j3PU+hIlABB5/aAFs44QXN9y20Fv
	oRjMUqGV2Pc1uTaqZitSnyO0pElE2+7JwWC63+Ykc6rzqi3bshvxFzvCEcSDjM0lFEr7GexGIct
	YsSrTjk9AdyvqohCjJqfdatRnCi/p9wkUlxxdoRIqFCrjYjfGrBM5ZgV6EmJlYJngJ6bK2B3nQS
	+bgHSwX3h2HIkA==
X-Google-Smtp-Source: AGHT+IFTAKZ9BquOVY29sEYMChLDnuqHcqVlSqR4NiZlMjD4bUMe9qRI5EU9r/6iyIf02WCX+Y2KzA==
X-Received: by 2002:a5d:4cca:0:b0:38a:2b34:e13e with SMTP id ffacd0b85a97d-38f33f28c01mr7768806f8f.18.1739815856721;
        Mon, 17 Feb 2025 10:10:56 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:a529:8667:e9bd:7f7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4395afaf052sm155075695e9.13.2025.02.17.10.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 10:10:55 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,  Ira Weiny
 <ira.weiny@intel.com>,  "Rafael J. Wysocki" <rafael@kernel.org>,  Stephen
 Boyd <sboyd@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,  Danilo Krummrich
 <dakr@kernel.org>,  Conor Dooley <conor.dooley@microchip.com>,  Daire
 McNamara <daire.mcnamara@microchip.com>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Douglas Anderson <dianders@chromium.org>,
  Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 1/7] driver core: auxiliary bus: add device creation
 helpers
In-Reply-To: <2025021501-tamer-sank-142a@gregkh> (Greg Kroah-Hartman's message
	of "Sat, 15 Feb 2025 07:53:12 +0100")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
	<20250211-aux-device-create-helper-v3-1-7edb50524909@baylibre.com>
	<2025021437-washout-stonewall-d13e@gregkh>
	<1jwmdsxugx.fsf@starbuckisacylon.baylibre.com>
	<2025021501-tamer-sank-142a@gregkh>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Mon, 17 Feb 2025 19:10:54 +0100
Message-ID: <1jikp8xx01.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat 15 Feb 2025 at 07:53, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

[...]

>> 
>> >
>> >> +							int id)
>> >> +{
>> >> +	struct auxiliary_device *auxdev;
>> >> +	int ret;
>> >> +
>> >> +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
>> >> +	if (!auxdev)
>> >> +		return ERR_PTR(-ENOMEM);
>> >
>> > Ick, who cares what the error value really is?  Why not just do NULL or
>> > a valid pointer?  That makes the caller much simpler to handle, right?
>> >
>> 
>> Sure why not

I have tried the 'NULL or valid' approach. In the consumers,
which mostly return an integer from their various init function, I got
this weird to come up with one from NULL. EINVAL, ENOMEM, etc ... can't
really pick one.

It is actually easier to pass something along.

>> 
>> >> +
>> >> +	auxdev->id = id;
>> >> +	auxdev->name = devname;
>> >> +	auxdev->dev.parent = dev;
>> >> +	auxdev->dev.platform_data = platform_data;
>> >> +	auxdev->dev.release = auxiliary_device_release;
>> >> +	device_set_of_node_from_dev(&auxdev->dev, dev);
>> >> +
>> >> +	ret = auxiliary_device_init(auxdev);
>> >
>> > Only way this will fail is if you forgot to set parent or a valid name.
>> > So why not check for devname being non-NULL above this?
>> 
>> If auxiliary_device_init() ever changes it would be easy to forget to
>> update that and lead to something nasty to debug, don't you think ?
>
> Yes, this is being more defensive, I take back my objection, thanks.
>
>> >> +	if (ret) {
>> >> +		kfree(auxdev);
>> >> +		return ERR_PTR(ret);
>> >> +	}
>> >> +
>> >> +	ret = __auxiliary_device_add(auxdev, modname);
>> >> +	if (ret) {
>> >> +		/*
>> >> +		 * NOTE: It may look odd but auxdev should not be freed
>> >> +		 * here. auxiliary_device_uninit() calls device_put()
>> >> +		 * which call the device release function, freeing auxdev.
>> >> +		 */
>> >> +		auxiliary_device_uninit(auxdev);
>> >
>> > Yes it is odd, are you SURE you should be calling device_del() on the
>> > device if this fails?  auxiliary_device_uninit(), makes sense so why not
>> > just call that here?
>> 
>> I'm confused ... I am call auxiliary_device_uninit() here. What do you
>> mean ? 
>
> Oh wow, I got this wrong, sorry, I was thinking you were calling
> auxiliary_device_destroy().  Nevermind, ugh, it was a long day...
>

No worries

> thanks,
>
> greg k-h

-- 
Jerome
