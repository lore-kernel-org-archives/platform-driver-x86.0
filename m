Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9869E25FA05
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 05:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780204434; cv=none; b=qqOJVTIeA01OBeefLKczLK0+JbbtxDZpILE+O2W0wEF76ULpucxhE+ytR8do0iBnBOkGB9UBYekACXw5CPyh91Nyyn/dYQcrt/JxL/+2sKhhsvtj5an8Ei26XpY2lwU7yO92pDOM+gBdbmOXzxLmAoAiBoHdtbW6hdQw2rcLzCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780204434; c=relaxed/simple;
	bh=LvCvl6PBBF8J/xKaNGS0MEYSeqnN/0taZuq8w2G+Az0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkC4jGGn+T4CoodPDo+PGA6KHM6lj5PF6xc/qvwox19/eK+8LEpv1cYY8oaczilDp66zXTmoCc1GG3z6QNwBRLB2n+D8wIh8qG0cgg0iznFnDwSoQvV10qCIpTY0enHHNicBeuZwjmCgjft5OjrRJmGI78rJyrttBqdnJMUPrUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGVCvhaL; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGVCvhaL"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-304b8ced372so6479674eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 May 2026 22:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780204433; x=1780809233; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k3pn4cuUfFSRyvhCaBTSBtnyydB0uD7dBx1ds5nx5l4=;
        b=FGVCvhaL9eJqxsOcwkywanUWKqdXcMdyFHMj998ZD5zTv7pAGwtECxT+15k1a6qGNq
         3qGWi/qCCHRa4tzW+7q246Dl3Rc3IKWfjiaAB8yPCpKVKCOTEmwmTwDvci4G7ZMKU2x1
         yG6YxMRjIGesqokaQ0SBjE7YAdhiM4n7MYALHqVcFyjsHSsmnh6+7Dlt3xwFlj93Yc1x
         JRLZzapmJ63bdcEBep0FR+nWIlAIh6P8mJVKMatOp5VzhdFaI5PY5rXXiaO/n4qmOBhm
         ZLz5mHTCmWc1xet3BIMF8Mk7nxY5WJPKPOW1f816jdmevSbPyZrhNzvMepdJqd0H9AGc
         nFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780204433; x=1780809233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k3pn4cuUfFSRyvhCaBTSBtnyydB0uD7dBx1ds5nx5l4=;
        b=Ug68mlICVVrsfPU1CkEwJZ4nXvgiFI8Ua9I7YRrW4jB9WMSXOy2aGbw2zUN0EZVwb5
         JKQUKpRJozR0Qe64x0zeYgDTlZWp2poch0qcwjeG0f20BfTGDq/z+uPimZNwQSX4gzla
         KUmpUQswMatpaJW+bS+CDhKjj8EvBTmrA69f/4fiFXcd7k3Abo+loI3rOI20TjivvnJE
         lnD/izCt2r0Hje7zr8IN1tBNtgjRBRW0Adhhe8mklH/kQUFH1XwuvS3CQcd6WCzZXUAZ
         V9z/IywLG+bx1lR5Dyzy/xui7Oivs2eBnpiwFdvtk/C4dxyhNmoVGp++eg9l8DS6BRZY
         MRfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Inm7phMFxEphu4h9mO0AeExPlywaEVaGZsZZ1skZXLeBHZdbWKVoSPf8em099k4HV9CuiRBLftY7RJpAPX3Xw1xvG@vger.kernel.org
X-Gm-Message-State: AOJu0YzwtTix0QjEP115MY+W7YuG1rmZSOQfqqQa33jswCEOVYxDW6OI
	VdrC9Cn0lFYGmM3+5iuME5JDOORwlnpKjorWv6SJ3D+sUPkJRGGQMQjQ
X-Gm-Gg: Acq92OHeuvTC5rqdSRNFOyA5aTsaoyPTl5wgcKZ8o8Tv64h2sOUC7hoUgORzk++sw37
	C44OqlNZrzZG2PkyJxNo8mwhptwsl34h9BVgVnZ4i2PUCrq4rBAV6w4eohJcllzywNJAEEDexJU
	JCxJoJixFgBGqW0rSAAmGra+kcELwOabAeNUPXls2vDMo9xNycu9e58XSwYrNyjlv0hLLW+aOpK
	+4u5+01ubZE9RbnGq2nugQwjYlFtXIxy9JTnrTUu1l4z8DR7jhygCbx7P+PFhPJjGJAXUiFaSqu
	Q06dHq/d2O2bChANVdFEcWku2yop2Lm4hS8riZa3/mLeSB++juUeRvA3whr0Zw1G35wk2mXl0BH
	m9oeuYoqma1qop0Ndi5uHvwDnl7B6gh+5rCxXXXbsnUw3AEQ357HYnaRrpRIITEN0G/dWNs6Wox
	S8aNjuaW/2uRyHu09j5jbddZg2LwHVAataSR6QEbi/cEfYzbRm2pEfYsReToOHCjqUqDqYcDOfY
	g==
X-Received: by 2002:a05:693c:300c:b0:2d9:5cd9:b8ff with SMTP id 5a478bee46e88-304fa4a757dmr2802692eec.6.1780204432587;
        Sat, 30 May 2026 22:13:52 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:aa7b:13a9:ea74:503])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2c3121sm5667940eec.5.2026.05.30.22.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 22:13:51 -0700 (PDT)
Date: Sat, 30 May 2026 22:13:47 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Anshul Dalal <anshulusr@gmail.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, Yassine Oudjana <y.oudjana@protonmail.com>, 
	Linus Walleij <linusw@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Support Opensource <support.opensource@diasemi.com>, Nick Dyer <nick@shmanahar.org>, Hans de Goede <hansg@kernel.org>, 
	Job Noorman <job@noorman.info>, Mika =?utf-8?B?UGVudHRpbMOk?= <mpenttil@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Kees Cook <kees@kernel.org>, bui duc phuc <phucduc.bui@gmail.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Yauhen Kharuzhy <jekhor@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Minseong Kim <ii4gsp@gmail.com>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Oleh Kuzhylnyi <kuzhylol@gmail.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Josua Mayer <josua@solid-run.com>, 
	Michael Tretter <m.tretter@pengutronix.de>, Jeff LaBundy <jeff@labundy.com>, 
	Javier Carrasco <javier.carrasco@wolfvision.net>, David Heidelberg <david@ixit.cz>, 
	Petr Hodina <petr.hodina@protonmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Johannes Kirchmair <johannes.kirchmair@skidata.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Xichao Zhao <zhao.xichao@vivo.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v1] Input: Use named initializers for arrays of
 i2c_device_data
Message-ID: <ahvDNu0TQKtjvmSk@google.com>
References: <20260515164848.497608-2-u.kleine-koenig@baylibre.com>
 <ahp7WuHiPYa7Q_pX@google.com>
 <ahrP4STTFdUsBp0O@monoceros>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ahrP4STTFdUsBp0O@monoceros>

On Sat, May 30, 2026 at 02:02:20PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Hello Dmitry,
> 
> On Fri, May 29, 2026 at 10:56:48PM -0700, Dmitry Torokhov wrote:
> > I like the ability to properly set up pointers for driver data, however
> > I do not think we should use named initializers for name field. As long
> > as we are not planning on moving its position I like the brevity of just
> > saying
> > 
> > 	{ "ili210x", .driver_data_ptr = &ili210x_chip },
> > 
> > Can we keep the old style for the name field?
> 
> I have no strong opinion here, my patch introduces the named initializer
> for both members for consistency. Note that my patches for all the other
> subsystems (and also other *_device_id) do the same and you're the first
> maintainer with that expressed preference.
> 
> I even sent a few patches that adapt initializers without .driver_data
> (e.g.
> https://lore.kernel.org/all/177932943265.3832404.360063047381979287.git-patchwork-notify@kernel.org/)
> that got positive feedback so far.
> 
> So if you're ok with having input differ in style from (up to now) all
> other subsystems, I can rework the patch.

OK, I guess I am too late to voice my opinion. I do not want to have
different style, in this particular case at least, so I applied the
patch.

Thanks.

-- 
Dmitry
