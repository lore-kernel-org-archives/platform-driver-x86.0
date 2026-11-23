Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795416481;
	b=nTlToKS59Ay3/J7Ow9Rh9J4LUGmjwxDba2Nck4cj31CgBkwnYTiLWA0HpxVczWiImO2Y
	 k2eFJ788CHqY8UOUJpXtrXdw0B25rKFen8L8VORgibQOjudzljhCQun+etrDx+vhS/us4
	 iIX6LdJBoaXFoP0+G1hFTYswp7aJZTmRu1jttYDJQeF2AHsk+HhbxGqykvxbtYZ18pDuy
	 /o3icTHBVxp+RfDQrMUf9r/XJxysQGjWxiZD6TVy/7pq5U2ANJY1lO3up9svcMcdjpX4Q
	 dH0TOMKPS1MUAXuFw/a0yAf3cFZJToTcZ0fBjxkWA0DLpU0wVl/mUmuCwYHdLwpxhpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=9XAnfSrCk5TAgri3G5kirQJ+1QUBkthXAlw0j/mwUvk=;
	b=APShF9nZjgrWlmZDp/tA9OTG7Gil42W8fNWmP48DTfBQ8qgVor6KmjU4cCEod7Cf7Q/g
	 a7aogCoJ1stuG7ipnw1C3fY4aMyXkH+dsmgr1d1gTX63S/tVzeDO36IUKbA8u/WWXcTdS
	 4JUqVIdqb61u03tAtTY1Iszpy0zZuFlM4ieth18IQXsG4Z2+kGS6BuTq/J0kMdfw6jR+O
	 FRy+cUl8r0SE07O3kYf6AdfmF9YsXxrzdv558RZpYlpESBNCly1Gr/OjHuNslRflC5nMX
	 yGsDXKTMK+GsQRRrkYX9ShuKVEsImP1iBHJgWf1ykxToIEJ7nMLtEUVgZwU6Hw5ymfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QtcT5jHJ;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id A471A606A321
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 06:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A471A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QtcT5jHJ
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f01f296937so22829845ad.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 22:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795416480; x=1796021280; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9XAnfSrCk5TAgri3G5kirQJ+1QUBkthXAlw0j/mwUvk=;
        b=QtcT5jHJqWm1+yYAA4VFMUP9cS+spmeKwR5RDKEV3n+c3ftxMf2A+S0r6XtwhfzSkA
         i89BXqck7v1ltIBc4g+zcm6rPOPLJn/WoTGr6fWujJ5HHX37VCCqn+5hkt4UpvPDAyK/
         DzuOh0Appm/d4BWAtNs5xZba9MLv+lEZJLKeuv9+JAAyKr9eFkW+rOMsNjggp1sksr5X
         B2JKTwP7urRGyQVRlhafyhdA2ffZMnmFgkniU7mpAO/qkc49LYqaFAX5hYEglksH7mef
         k7TEeU43ML1MTVqG7C5tNuJ/CESrvVz2mPnzpvEBeefrauZymIXXWJIHNRH3mUgbvMWa
         6S3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416480; x=1796021280;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9XAnfSrCk5TAgri3G5kirQJ+1QUBkthXAlw0j/mwUvk=;
        b=XRpRSS3JOwRMvKE/JZr1tYGIXfrGZg9fDwoW/Z2ZPRnVDJB2agAWHMkiRDPvSEDjxm
         6DpK1idTpMTf827/p1kTreo3/mNhRTIefR0HFapxSePmz+6Kq5XWOWRI27+zrhOjgeEQ
         amkKrrqak2+7soYu05U+PPexHD/9DN/CsmilAjDn7SElakM2FyoRf3BxBpIMuynAQ5C5
         jER4uf8RCJjn0VszIGGFDFts/mCfDV4bdClFdFOAUxLLbqCYg5eaaLfYHfTlA4wyEjnt
         VX4JlGFinlsCq6OBKt9h2Sv1FTs84+gLb1UtZmZ+2MpkN+Mta2R2jsmnJwKhpw4SeZTU
         nSaQ==
X-Forwarded-Encrypted: i=1; AL+hErEVuAMrA7YhjCyhoavBY3CBIdeL+bq3KZWrss5cgdisPxKJEC1YAUXvx+ARyPbUaNfO2cpIs/GwIcKA/ZMZGQndhSbA@vger.kernel.org
X-Gm-Message-State: APuU4Z/67L0Vgc+tdh100GA0ZaFftZUku7P010SsLSdQDwmrZ81GENCn
	SAcL3luO4sA0FMrc3oyC/lkNHQJ00Ja/YK2JohnC1M9JYSfWJ37EFz/S
X-Gm-Gg: AZFdTZfLsYS+cB8L+xeRvIE9Wy7z1ljY1pF3o/4WGjiiwsvjUO3pLPE0/SMbCHLET5F
	Mdt98Qaj//5Ima3fYzBHRaxn5IyPvjKXlWXCdxirGrf1Ao/CJoo0gxBfUPjxpqLg+fjgystbN2a
	XXLj1bAaEukjAqR5K7u3JRoYIR9gEIHPBE7+YjllPOIHWLL6XGXWqyxnhURRjlwYcZBOUqL80vK
	vtUyaujVhztzMTQIC0ahMrUetHGw/Y9Wc8NLHt9qU7trvdPSPH0TpZAcxNZzvp6VGCMAFUH0jh1
	PwFR/BnD55cdkrd0dJg1uUVmZVIi/bOfVObPjDkjDnu9Zo4gn0IKcXY4iXt47GFNNQhq4O+WWSs
	PFDmTCO1+ZdFvZQzHiAE5oGx+Y5w4tFjs7q+gP/ErzRnLIeeg6lPBlAKirVMJHQ+ATDOcRA0YsR
	ZS7/uS0ID49S2jnZAdT4SaTr4ukN2PpSmI0Ta1AB5PY/xhj8KxxaObVjeXaXG6k+LEqouAJymaf
	j9RK7TTvqGbIqoEoI36pe6OWpHC3/V/dVdId5qyj/3Y6X17YNand0ghZaoSbCdh2gIbqnu5Xehy
	6/LC/MwOqsCNCEwD9W8RWe4saZkmePnaDgNBz+tYn93ES91bWN2QUfmpIFYVnGG/IFpJgQ==
X-Received: by 2002:a17:902:ce82:b0:2ef:e9df:2422 with SMTP id d9443c01a7336-2f03f1cf4e6mr103786255ad.16.1795416479999;
        Sun, 22 Nov 2026 22:47:59 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84364sm48678155ad.5.2026.11.22.22.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:47:59 -0800 (PST)
Date: Sun, 22 Nov 2026 22:47:58 -0800
Message-ID: <8ee0713aa3e3cb1e54c0a60f1b32cb86@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Corey Minyard <corey@minyard.net>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 8/8] power: supply: sbs-battery: use 4-argument i2c_smbus_read_block_data()
In-Reply-To: <avELD9tlEfl9Uth7@venus>
References: <20261024-i2c-smbus-read-block-data-v1-0-19bb97467982@gmail.com> <20261024-i2c-smbus-read-block-data-v1-8-19bb97467982@gmail.com> <avELD9tlEfl9Uth7@venus>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Sebastian,

On Mon, Nov 09, 2026 at 12:52:18AM +0100, Sebastian Reichel wrote:
> On Sat, Oct 24, 2026 at 07:48:48PM -0700, Dmitry Torokhov wrote:
> > Pass the destination buffer size to sbs_read_string_data(), and pass
> > the buffer capacity reserving space for a trailing NUL terminator to
> > i2c_smbus_read_block_data().
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Thank you for the ack. Will you be applying this patch to your tree, or
do you expect me to queue it through mine?

Thanks.

-- 
Dmitry
