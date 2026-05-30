Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0DA3D76
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 May 2026 05:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780120616; cv=none; b=uPjFU/h6WGqG1rNFSvoIdUzi/WVma4fP2W3jdokBPq+4nqc9cX3Q7sXa8G8Lm5INsk1ypvBIvYZVscoiB67wZboNscw2uPWxPvvx5B58lfgnl+WCXiOt3GaZDeeEfgmafkMjQ5bSaGMpj3pyz+Rd7JBVk3MkfB8rio6aUbYEqJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780120616; c=relaxed/simple;
	bh=VKlbh9zABe3hibSJP65y9fDmKIjGpOWF/vplfy6zmFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOG80QXjQCMQynVfqMPItvZgdstjR6telQATzRG77J101nNZvPbsebzpMnFlFXc0s4VQg/0oZDupNUpXaDFdoRZi5N7s28o67VzN3MH4gP/bobR4iGylbYhYYciw6Y3YeEbhThk2iGsfj0gtcbyX2z0zXUfY14V1I4IGCHbsILQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IY9aLBn0; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IY9aLBn0"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-304ec41197bso1374058eec.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 May 2026 22:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780120613; x=1780725413; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uR8xbGosrZDiZ3bGOF/uomoehMbPSntRHGsC0W465dY=;
        b=IY9aLBn0Y5TN6P5kMJGt0mMohZ5iKW+MXKngkZgWYnfYC8zC9Mi4iTXkoz+T1BmwJ1
         0I/cDban2uJZVXzczDLBAlW6apmd3o2E+asFknRPRv8sBSeBeMKhDvWLGJC+e8JDMU6F
         +Tq/N51cDIDxPDbcLgOb0LHgnPxcs3LyviHMBQQ8+5nKXgLZkQZA8D2IOmXu+1MXaLIz
         f7vfl9swyNQGpyUtg78ewSUXeLLeXYzPjWqE+5oqhknfClnOIWALL94VwQO40iS5iAw/
         wfcguMFr0l6vVhOHCTCaovanBC76BLNzqe20JbRo25CTf7T/bD4/rR9/wyKbYRTibduz
         LZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780120613; x=1780725413;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uR8xbGosrZDiZ3bGOF/uomoehMbPSntRHGsC0W465dY=;
        b=M5sKWUA6J5Mqg64xnZPcKkpRpZJDCCzzetsQqxLvpBJbgDddoysuhZDETaoa7l4EZa
         5SGzETBm2nTvpV05qM8SqL3p1iOM4UZElWtUlpCymRo0bkdVnbvVRx0yfFsYEJrJp1pz
         VaEUtBaz+gKDbke4k7jjdQKqIzqbDOgp2KKi7s1TjUiBnkOUgYuycJO48qDjeeAd86H7
         h/OSfmuCq4aLK4HAHHCXTYPI7u2SCcJZ4nqm6zrKyHt/1ZHeO2qZ6PLlNCD1tYhXGALI
         6OiKeMjvL3ECU72LwNUq1GbfxqgOBCbp9oHCa6Ql7v+FTLb6MlRwqgsmx+1ZsWkL5U01
         sNqw==
X-Forwarded-Encrypted: i=1; AFNElJ95bAWaewwUXFs8vcOQiAtfeESYoG9b+v5rudvObFW/Q3FzdNsafxhfoXLB10IG/kHkCCc2KjQUV5+Zavu6XhP2Hecs@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnbo9Fj7BtMOsgwQgMa0/tg8ykRq4ogpKvmU7X4TJ78keWExMO
	4XumWbNgQopMHi0ow2G4q4yDwkbSo2oaAZNEZBt1hRipqeZJPw6X30fn
X-Gm-Gg: Acq92OFF9mbf6gGu7Yo+BENNRGqlrLVb+Kfn9QterAUqO4vOByHaH53UNzT3oz8EdRY
	TPQvTfk6VZ6PIL5lyQmuEkVHemIpD1oBACBx/nJNSpLFfY7CHob6aD0BQ+ytuUAjQCfuN7e9RYI
	6ttEAqWg6b1zA89Ln6i6ibRkkVEnavIEZOrNsvR2zekVEyUSFtXLed1P27cidoPXCW1xYlFmhEJ
	9qGXtq1FbLUIcuSBXaDVtRzvw3xEJwpdTcscIeYCAK4nhRMBw4gKtLYL0lR8igVCTSRIcCD4RV0
	ggXtxV+eBdABEdK3Wu8WhCuVsgaIje3MG2mQfKj+XL4gn42fRKFpywYxt9XlDQQkR6DUCUxJ78s
	ZoaP+T5Gjn2KbbJNYqOzok2m2+gX9C8DmXSkogYxB33pZy8DbEAPJkEqkuHKAAvp3NJQ83ga7qP
	ny/a7FgmQAoFUtKGqa+JnmFamST20ekXY0G0JPysrG+XrEPLjH3uQSBV/zKsXcMtsDxLwOXt9hp
	ZM=
X-Received: by 2002:a05:7300:80c9:b0:2e0:1f09:d924 with SMTP id 5a478bee46e88-304fa526036mr1388786eec.5.1780120613171;
        Fri, 29 May 2026 22:56:53 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:307d:2a52:8823:4a01])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53f002sm3397737eec.18.2026.05.29.22.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 22:56:52 -0700 (PDT)
Date: Fri, 29 May 2026 22:56:48 -0700
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
Message-ID: <ahp7WuHiPYa7Q_pX@google.com>
References: <20260515164848.497608-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260515164848.497608-2-u.kleine-koenig@baylibre.com>

Hi Uwe,

On Fri, May 15, 2026 at 06:48:47PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
> 
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> the mentioned change to i2c_device_id is the following:
> 
> 	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> 	index 23ff24080dfd..aebd3a5e90af 100644
> 	--- a/include/linux/mod_devicetable.h
> 	+++ b/include/linux/mod_devicetable.h
> 	@@ -477,7 +477,11 @@ struct rpmsg_device_id {
> 	
> 	 struct i2c_device_id {
> 	 	char name[I2C_NAME_SIZE];
> 	-	kernel_ulong_t driver_data;     /* Data private to the driver */
> 	+	union {
> 	+		/* Data private to the driver */
> 	+		kernel_ulong_t driver_data;
> 	+		const void *driver_data_ptr;
> 	+	};
> 	 };
> 	
> 	 /* pci_epf */
> 
> and this requires that .driver_data is assigned via a named initializer
> for static data. This requirement isn't a bad one because named
> initializers are also much better readable than list initializers.
> 
> The union added to struct i2c_device_id enables further cleanups like:
> 
> 	diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> 	index 66ada7ffbc80..94aa4dc002c5 100644
> 	--- a/drivers/input/touchscreen/ili210x.c
> 	+++ b/drivers/input/touchscreen/ili210x.c
> 	@@ -969,7 +969,7 @@ static int ili210x_i2c_probe(struct i2c_client *client)
> 	 
> 		chip = device_get_match_data(dev);
> 		if (!chip && id)
> 	-		chip = (const struct ili2xxx_chip *)id->driver_data;
> 	+		chip = id->driver_data_ptr;
> 		if (!chip)
> 			return dev_err_probe(&client->dev, -ENODEV, "unknown device model\n");
> 	 
> 	@@ -1049,10 +1049,10 @@ static int ili210x_i2c_probe(struct i2c_client *client)
> 	 }
> 	 
> 	 static const struct i2c_device_id ili210x_i2c_id[] = {
> 	-	{ .name = "ili210x", .driver_data = (long)&ili210x_chip },
> 	-	{ .name = "ili2117", .driver_data = (long)&ili211x_chip },
> 	-	{ .name = "ili2120", .driver_data = (long)&ili212x_chip },
> 	-	{ .name = "ili251x", .driver_data = (long)&ili251x_chip },
> 	+	{ .name = "ili210x", .driver_data_ptr = &ili210x_chip },
> 	+	{ .name = "ili2117", .driver_data_ptr = &ili211x_chip },
> 	+	{ .name = "ili2120", .driver_data_ptr = &ili212x_chip },
> 	+	{ .name = "ili251x", .driver_data_ptr = &ili251x_chip },
> 		{ }
> 	 };
> 	 MODULE_DEVICE_TABLE(i2c, ili210x_i2c_id);
> 
> that are an improvement for readability (again!) and it keeps some
> properties of the pointers (here: being const) without having to pay
> attention for that.
> 
> My additional motivation for this effort is CHERI[1]. This is a hardware
> extension that uses 128 bit pointers but unsigned long is still 64 bit.
> So with CHERI you cannot store pointers in unsigned long variables.

I like the ability to properly set up pointers for driver data, however
I do not think we should use named initializers for name field. As long
as we are not planning on moving its position I like the brevity of just
saying

	{ "ili210x", .driver_data_ptr = &ili210x_chip },

Can we keep the old style for the name field?

Thanks.

-- 
Dmitry
