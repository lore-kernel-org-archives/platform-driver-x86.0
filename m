Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E2928643D
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 21:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758316811; cv=none; b=A6RI661Ia4hON6KHuexCGB2aMDCY1uSQCG5PpBq6jeM4oH6i5mUr20mWx6OIW1fyMBvRJGG7Bnby/C1JIPiLQfjLpPJHQGF/57Zitjh3wKVgWCO2llcAPEgpA9Ov5XgAEmZPmCz+QQQJrUpZD8NdjWKXeZ9jAofVbkA3gehsv8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758316811; c=relaxed/simple;
	bh=l3VwbGD2WfWOTvzV2uVrXsRffSm/zRB9ZXRdHCPZmFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mk/Zx9JGJDh0axb7OepNBrNBNIZzW9BX1U+UUgCWA6ruKxltMUP3GIXrjvBtLI4LbFEgp/AnUCQU//p452y8T31K+pzjoPfVtkamybwVv+Flm6doQy2KsBtStI/K+C7RwXSFXCXggMs0a7JMtIp14u2p8gAewESyyOgZap7nIxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpAjPMQ5; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpAjPMQ5"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-77e69f69281so1198025b3a.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 14:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758316809; x=1758921609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dqYQ2QT7ewyLKOw+dRyNXshWySmfSzQS/h6+fwtLzlM=;
        b=RpAjPMQ5AM9xqx/4TcZcmnM4AdJS+Neb3r+WfG/4VAAoEE+1v3e3ocKEcYyb5hIC+Z
         0YzDWcpYoKhztYcBpHXQwZZ3NgxyurDGlBavS/h6NWYN5iwa3wktMI2THznWX+miFA2c
         VptJKCOqK06aC+KB0DcPU7loTPzlJfVeDIOS/sBOMnoNSeXkj8zZhwxLddY08mQJ4SJt
         Yc3083gBSLvdZ9R5qVaEOl4VRKQWnwk3HCVgSB5HCVfY3aYEaS0eF4vRwsqUXmC6Q9hq
         t81Ne8aCVRVO0/kMyld6mYfSKZvHn9AjI90Ij2ShyDaUP180mot/UuGpw9At5vQUGwOP
         EDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758316809; x=1758921609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqYQ2QT7ewyLKOw+dRyNXshWySmfSzQS/h6+fwtLzlM=;
        b=G7sGPYc/zws/QttcLf03TkGerzqWLzUL/JgBlAxTnkQhl4LM2sKydzgKRP9Vhpi+U+
         /M62z/GR8LYbAQLaT1ncnXXWf/+9cNu2O3Ldba5Raj3ousY9U8ROf8OL0N7wH3SDOF4T
         nmMRIbkqZMQDKvD2ozaFfUECGx0cQ+u45yjLZaYgnRzcjct32+IIejRyAMZNf01MAQmx
         DlR6ujcUJdEEGKhFWxQur7AFQWvXoE2gHvRZrcy+VoqlszyGraPh/nwxY93PoGEAXF6Q
         hbHaI5+wMIX1eqOHyOKI9cU6yUY3isJQDLWAq0oiG7YNLFhLzKECE/U5PGYwgDl7So8y
         noeA==
X-Forwarded-Encrypted: i=1; AJvYcCXEFArT9Q3m1AAim/Fin4Xc80JRsyZUdG66vZqTB/zISv4u6mrc0agVrf6NADh0FKKKxdNV/O095upSRMOCjMvsxlyf@vger.kernel.org
X-Gm-Message-State: AOJu0YyYCqdiL835G7H8a7/iWG6A7yQiG3w3D5bs9nQgyXZxSGu0H0hX
	mpKwUrS8KKpr0GHA1gkLeKTUN+haj8j4CND7/s4rL+yQvlm6iWazVDpq
X-Gm-Gg: ASbGncsZW/OtyNSbZ/1g4akK6328MrYa+dSQL7qHZIm7UpQEFspsr9458ejZhhtjFbv
	lC+LUEv4CVozgkmb0XxphpublNYgjcirvbf2Bx1xBmsYmCHZRPABD7nxEqqnoqvGREaN05kfXhZ
	yv3ae8xXgdpVuSWqch+a7FwAJ5ZeI+y1O6fUy3f6WBLFEY9Sw6ym3P/yo0nAk+EqteTG68biArw
	2hTO9QQY+qSS8brZLHwCwZl5WfFJ+R94o/Ep8YwnsHLtJni3BlZtekLSh/0EEP1LVC9Xr4CG2ox
	46aNT3DFRzKAB3iQnnnoDK4fP7OjkcASyl31wFxJLBnnylXpPOq8jYJNWbiQJLoxITLWwK9CLib
	CWBqbHjtKZsSD+JuSE0dbPo4=
X-Google-Smtp-Source: AGHT+IHp4WxemJUVB+65lXGibV+5PLCBOWpAJHifWnEPVEiCDqK0BKpDugF8mR0vwG9Ac1Er0dA0Vg==
X-Received: by 2002:a05:6a21:e081:b0:248:86a1:a242 with SMTP id adf61e73a8af0-2920104846amr6827953637.4.1758316809206;
        Fri, 19 Sep 2025 14:20:09 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5621:6657:a035:d5ee])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfe669092sm6040241b3a.47.2025.09.19.14.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 14:20:08 -0700 (PDT)
Date: Fri, 19 Sep 2025 14:20:06 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 19/19] platform/x86: x86-android-tablets: Stop using
 EPROBE_DEFER
Message-ID: <jxhsqa6hn47arltmkrbfj45o3zuy3n6p43jbrazejkvru6kj6l@k2n3i2czb3yi>
References: <20250919204742.25581-1-hansg@kernel.org>
 <20250919204742.25581-20-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919204742.25581-20-hansg@kernel.org>

On Fri, Sep 19, 2025 at 10:47:42PM +0200, Hans de Goede wrote:
> Since the x86-android-tablets code uses platform_create_bundle() it cannot
> use EPROBE_DEFER and the driver-core will translate EPROBE_DEFER to ENXIO.
> 
> Stop using EPROBE_DEFER instead log an error and return ENODEV, or for non
> fatal cases log a warning and return 0.
> 
> Signed-off-by: Hans de Goede <hansg@kernel.org>

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
