Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136D72877F1
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 21:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758316331; cv=none; b=Q1BlCSN+J8ezHQPSnvJ7H/2CMXpNfKPLg3q9cFOwwYxU99duvyawGG1KSV/wcfzO49xqam1Ofabbgg4kd9No1TLNaLssmk8JjotRsR+gE0wUdE9NfaVXgBXgL3VLnSDjY2DrwfMli1QFVQOes80IakkY41TtpMwSnEHOoeY6rE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758316331; c=relaxed/simple;
	bh=B7xUfVK/Jtm6HM4rk+fFSsIoDeujVCRRsVY3a8koZ0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3cZsPPID8kwSE8+eKEmV2asMUFw9QC6RopnwSUS92DdzyfG/pvrZ2N+MCmzYRos5JZ0zVdx9DKNZ7TtzEmMh5mxViip7ZQkN9gLb+H8FaUmjdZWtBZeMjMG4BeS0t7nQYi4n50tHVYiXgJeZxSmCeayiJTJcq91Mi8PZ5N4MYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQk/xCYh; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQk/xCYh"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b54a2ab01ffso1817269a12.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 14:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758316329; x=1758921129; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g2MMwnPSfkUvUOSGaWqjUzAqZtJT/82cJH/3oFugjBg=;
        b=CQk/xCYhwPHAQ89n7ojCnTvvKVD0crWBzhKkMLbrT2Wzi+plZ5qg6oV5ICWrDzLGuL
         pL8YYw0kjruJOALJaXuq6FvnUtDF+bhb0D1vT2xatpLcZoqswWZolH0Z2ic4zbiSeIOH
         CFGh7twaDpx0J8U8VnoK98tSVo6NKX2ro0XWUsoTBFxO+qelQoXPojPov2CQERi4kkjy
         3J8cc4pWxFftymb9fDdiUPndRwxX+o2nxUrXXfT5rEA4ECSRe855mG7HVdG0aum1tGnu
         Ki2mIrIHt4hOOZBsmCVFMOLfwG0MYgcASCEbHsHfO8cGp+FkLnIFwN79Acli9KZTPS3P
         db0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758316329; x=1758921129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2MMwnPSfkUvUOSGaWqjUzAqZtJT/82cJH/3oFugjBg=;
        b=Ou8+Gt4KdnwLbTMR+Ei2XOeLSPzBpfkBIN2laQVOzyHzztMvOMEswCx1ktOm1tW5Ns
         RuA2YTp1f/0Zr2PBx/KMga8IDG18ccy312co5rEzvUhI+MkndOC7pgMy47fTfJjBxdBH
         t8z4UuZ29lvGMjjjfZ9iHpCgERfEilyk1f2A1/jWEMokLompeK1uP9QgtbfHo1584x3F
         vDYGgH75gXIiwtxSrUsiGf0+Mom2UWFLc5NOrghxMzxZelAFuKZpJpVrORg2PmxJic8Y
         BXicS2elfSWDHb5bZIpIPT05jMt2odWz9fSvXye1M9osts88wMmbIxMPRK3KiGHMbUSQ
         0+TA==
X-Forwarded-Encrypted: i=1; AJvYcCUxhBGjiXP7OQ06i5we312efAexU8py8SVYY2COCc03IE2BoiHILda3S/Dx8aiSsyK8uYcGrYbuRr4VrcPxSJB81B8g@vger.kernel.org
X-Gm-Message-State: AOJu0YyHJF8z/+lB9v5l2CHOoF9B6XecY3H1NFHiDltgs2sptTITY0NP
	cueuNlB6DQIbxLbdXqMD50cISH/6IybGQKvTo+DzH2bDdtktx5cr/cbx
X-Gm-Gg: ASbGncvweHY3e952R2Wm+RgCT+NebBlhEjWzvg6m+clTjs+o28AZrX7W/hE8EyT+put
	fk455z4FL2H/ZQi3iYqmrzoH2hZxSgbWbBQR06QBvHuItb3ZVe3sQCqHTFZ3sS8S2BOlQuO+3k+
	utULjx673RPxrNDq0mLZaBE6jPaYLDtvMIwiYTZXLXl/7Tx7LfKXUGILvuepmHJdolSMEpbwFKb
	3N6DemXXkdhs0ER+L5lvIdU3ezNNg7PjiC4a0o+NWZeZJw1enVRjU6EVVFDMV9jLQe0w53dUEik
	0rP7g4hYmUy/MTEb0Uo8MXU7OePE0jE7BU+wDGz+Y6K4tCwf80pFE+tlbu37q7pJrRZqSd+XCwr
	6XA029r2fSSnWsrpe6lxEOLA=
X-Google-Smtp-Source: AGHT+IFb4HhgtHtoIlohK2ht7+tvZ5Hghdb6dVA4xM744uzXn8G7kOqy6oKmsQPsoklbLK9T7F0xog==
X-Received: by 2002:a17:902:c402:b0:251:5900:9803 with SMTP id d9443c01a7336-269ba455012mr63108995ad.21.1758316329057;
        Fri, 19 Sep 2025 14:12:09 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5621:6657:a035:d5ee])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2699ae52db1sm52639475ad.43.2025.09.19.14.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 14:12:08 -0700 (PDT)
Date: Fri, 19 Sep 2025 14:12:06 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 17/19] platform/x86: x86-android-tablets: Simplify
 lenovo_yoga_tab2_830_1050_exit()
Message-ID: <jcrsrmkdnkxwerojspggkivzvrodnujjzk2gyktsdl2ifqwnmt@x326trbyqwjg>
References: <20250919204742.25581-1-hansg@kernel.org>
 <20250919204742.25581-18-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919204742.25581-18-hansg@kernel.org>

On Fri, Sep 19, 2025 at 10:47:40PM +0200, Hans de Goede wrote:
> lenovo_yoga_tab2_830_1050_exit() only gets called after a successful
> lenovo_yoga_tab2_830_1050_init() call so there is no need to check
> if lenovo_yoga_tab2_830_1050_codec_[dev|pinctrl] are set.
> 
> Also change the exit() order to be the exact reverse of init().
> 
> Signed-off-by: Hans de Goede <hansg@kernel.org>

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
