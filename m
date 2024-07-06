Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA9929CA
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jul 2024 14:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720276309; cv=none; b=ESOpc7SvW8iqYQP0Yg4Wx2cw+elo7nJ5nGIGHUVKIktxYujsF2qAaBtVjWegh867gLqwbFyCrZvVObtXuYRJBMGn7GBTFmaO9kJtAIWLPWc7+Pt1AeJntCoAFjdWuLa7v5Djn23HR7GX93byh/ptdJEzkzXAsZ9yBPtIcrMTOKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720276309; c=relaxed/simple;
	bh=RyneS6oFPE0OubqmLxD/Qgebv0IZphHD7L6l2ch5LE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=goj5bq8YqfyhvBZbfgxd6PjLJZK5bO8hN/7IaOlZWkHEFLCuRGAV8kIvy3x9sC4xh/0VROt9eCn5L+nkP4A5qSMbnH5jyFmyzhj60KYguGGPjxas0qWi0BLVE/OINZoeJkEjQg4joXnjWvDZemui4UrSytYoZleQD2XdQ/DeySM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBShTyBw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBShTyBw"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4255fc43f1cso17047415e9.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 06 Jul 2024 07:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720276307; x=1720881107; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qDM27hV1eT0YbSzsXxIleTSElI06sgq3ToUbb9ZXOzY=;
        b=dBShTyBwTgtJjQGSr2ky9DaSiH2jYmLtToWFJTvbxvAkzFjk40trZdG/aHIbMLwxYy
         hlWL99Tdx5s9sf7blDfDj8FfKznIIT6OJkXcw2Sj9BUgUiQueHJR4qvAiXW06/hLxqI6
         pUNwfsBkeQpOgTGvXSJw835JmDHsiXScVXn939qSAX5uno4DJNlL08HwzJlJtuCrO0HG
         7FQzpBLJF/JNC2HM/FHS6yUZKzLgf4twZLeHwvcJguoi24UW6pufxdBhE36BIsMgmzfQ
         GjJExtXTWC32BUrFv58S141D+m6nEWxCOdNHo0nriy6lLdj2+ZRCcswGBu7b0LH0gma6
         tC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720276307; x=1720881107;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qDM27hV1eT0YbSzsXxIleTSElI06sgq3ToUbb9ZXOzY=;
        b=A+T+pZ8kzGwAs2X3w1OZl5qahFxb5VgJRmxOU+E6TNvTaHRSoWT6p2VL1iVo/Zqw07
         Acz/wQkQBaA+5z5NJg572aogOqULaBvxv0pPijGYqTF0w/+imgQC9JpabTYNb7iwe24n
         NTQM2glU4wpgebyqUSt3t2yd85+FkYMm7eq6um0Y2xmK39N5L7urcb8a3uCe9NHeyX+y
         FZ5dsu2t9xt+PuxKCXHioAtoX+hkOgdbHyMirN8CsyPe1y3sTp5R3cHo4IAj0+AdFnZs
         JHSdAZ4UpJVM8+C4uiqmhavz03iUeR3D8Djv60Jb7ZofnQB9BB+JZwLyjLPHONoVU+wK
         gZPw==
X-Gm-Message-State: AOJu0YwXs579JihnG9B/WEGA95nDMb9msMRqqmVMBQo7bnEbK1FuOq9s
	2TfqJDK5RRwOPlBVY1apz/3wk7dwXd+XL8hPJ/+3pwEDD0Pwz7aV
X-Google-Smtp-Source: AGHT+IGC/Hbnj65mFCQ7U0arPYtaMHp8QRpdTmwPze703MXd4erAUODCgTwrKu226RN9mMBD53W1QQ==
X-Received: by 2002:a05:600c:4f14:b0:426:5f06:5462 with SMTP id 5b1f17b1804b1-4265f06546amr12970805e9.37.1720276306389;
        Sat, 06 Jul 2024 07:31:46 -0700 (PDT)
Received: from alexis-pc (cust-west-par-46-193-0-235.cust.wifirst.net. [46.193.0.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d0b24sm98527595e9.3.2024.07.06.07.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 07:31:45 -0700 (PDT)
Date: Sat, 6 Jul 2024 16:31:44 +0200
From: Alexis Belmonte <alexbelm48@gmail.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, W_Armin@gmx.de,
	hdegoede@redhat.com
Subject: Re: [PATCHv9] platform/x86: hp-wmi: Fix platform profile option
 switch bug on Omen and Victus laptops
Message-ID: <ZolVUBcjoJm_6NYN@alexis-pc>
References: <ZofRxNfk-ExL5VnN@alexis-pc>
 <75b64561-db2b-9fa2-ecdd-d0b573f9b67e@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75b64561-db2b-9fa2-ecdd-d0b573f9b67e@linux.intel.com>

Hi Ilpo,

On Sat, Jul 06, 2024 at 04:02:10PM +0300, Ilpo Järvinen wrote:
> > +
> > +	err = unregister_acpi_notifier(&platform_power_source_nb);
> > +
> > +	if (err < 0)
> > +		pr_err("Failed to remove ACPI power source notify handler\n");
> 
> Do we really need this? I don't think deinit paths in general log errors 
> (or handle them either).
> 
This is something that we discussed with Armin in an earlier revision of
the patch:

On Thu, Jun 20, 2024 at 10:12:21PM +0200, Armin Wolf wrote:
> > On Thu, Jun 27, 2024 at 07:55:26PM +0200, Armin Wolf wrote:
> >>>    static void __exit hp_wmi_exit(void)
> >>>    {
> >>> +   if (is_omen_thermal_profile() || is_victus_thermal_profile())
> >>> +           omen_unregister_powersource_event_handler();
> >> You have to check if the event handler was registered successfully before
> >> unregistering it.
> >>
> > Out of curiosity, I did a grep on the kernel drivers source code for
> > register_acpi_notifier/unregister_acpi_notifier and it seems that the
> > common practice is to not check for the return value at all (check out
> > drivers/gpu/drm/radeon/radeon_acpi.c:785 for example).
> >
> > Should I still check for the return value? I also believe there's no
> > proper method to check if a handler is registered or not, so I would
> > believe that I need to keep track of it myself; but since most kernel
> > drivers do not even care about the return value, I am not sure about
> > this.
> 
> This seems to me like a very fragile construct, but i believe that error
> checking should be done here regardless.
> 
> Maybe you should abort loading of the module when registration fails, so
> hp_wmi_exit() is only called when the notifier was registered successfully.
>
It made sense for me to abort during module loading, so that's what I ended up
doing.

I did a little bit of investigation on unregister_acpi_notifier which
relies on a blocking notifier chain internally. This brings me to
notifier_chain_unregister:

47:static int notifier_chain_unregister(struct notifier_block **nl,
48-		struct notifier_block *n)
49-{
50-	while ((*nl) != NULL) {
51-		if ((*nl) == n) {
52-			rcu_assign_pointer(*nl, n->next);
53-			trace_notifier_unregister((void *)n->notifier_call);
54-			return 0;
55-		}
56-		nl = &((*nl)->next);
57-	}
58-	return -ENOENT;
59-}

So it seems that the only error that can be raised from this function is
when the notifier is not found in the chain. This cannot be the case
here, so I understand why most modules do not check for the return
value, at least when unregistering the ACPI notifier.

If Armin is okay with this, I'll remove the error handling and the error
message.

I've taken into account your other comments, and will send a V10 once
everything's good.

Thanks for your time! :]

Alexis
