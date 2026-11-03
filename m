Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736275;
	b=ta3H3gLqXVclYbVTpSNpUFneysgDBqu8TxIUhkiaNK6nhLJYk1UbR/MzJbEZ05lysat+
	 nZcW1OZF3w0GeSOk4eDGeb5lYrhgOeO1rKDIEw4D2qrLPXQ9ff373ws8eSqnFsp2LoMpO
	 vDxB8MfSQcsLnGI7B7wPwwLVaX8tFKE/dwwhupe7CwO1QULGzuLqp50f2efEenLQeITYC
	 sIaVu0NuY07MrM5HD+3wO4etqF1va4B3TuU1mpGKsPH7lVgRaFugkelsU4Cxx6fShJaUf
	 fQlN6hSKTiyzOxKx5DgHmzvmPoO3AckBzSdRqwgnn4B8EuYArJetUcOxTui8HGTVNug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=go4AIpvhBkoC7ZGd8wKwZdjhT/BPEGzJrSrX2YZDWhc=;
	b=okPWA886yzCCiCgKWHghWnh1NZE1r8y9B5JM3dU/oL2Rt7GBMD0oB9CxxahuDFAx2R0g
	 2uSZPd3ZIhEnTPr7klm/bY8LE4yGd2NMSrhTRi7iCugh5esZ8b3E+Wgm2YuUmAsCqcSmy
	 YqS9EvogQYHFoFguACaVqdjMTBCEnVeI/D8MksMG+bc6Lcc4fKXSWQ7D/LTjsLWtZAN62
	 UFEcltsfMINzuq8OetvRlk4kW2KrNrP+0aNFe9Lb934cJeQzXVTXUf0EUaLPZOqTzzWDC
	 KizYlmDX4+l5OInKSbOCWixJ/ZtXoXwr02fjYhh5a8MwCF2TC28bfyJcQvNOdTKX+qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MY3vc6Gb;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34833606A331
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2026 20:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34833606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MY3vc6Gb
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35b2c599f43so8212907eec.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Nov 2026 12:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793736274; x=1794341074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=go4AIpvhBkoC7ZGd8wKwZdjhT/BPEGzJrSrX2YZDWhc=;
        b=MY3vc6Gbvvfq42ubgxn7ZiALrft/xLB+7RdNtGFpyhdTAWULvE/ASxqtUVijeZaLAG
         pFKwTl7Old40mDX8hTr504VOvLwRmf6WVo0XKxWHImHyLsyuvO5cI1YC7tyUOb9E2Ov4
         ZupY/VOPLYTmU/TSmjc5sIO5R0nqbRrhc3gWtc1PAW4PGvUZRAa5TTXXr/Ol/wguGV04
         /NyrkwL8H+JcKuFKPUwQu2sHRwhVoxKd3+a7lgDpWBVwlzlTOj+u8qnjv3odQL7LHfl6
         id4GY7sKuMug1ts1LrY+1VLRHv5zI9HugBWlvGhAGFXapCIpnKpd9Sz4vKeVcJt7nGUP
         lk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736274; x=1794341074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=go4AIpvhBkoC7ZGd8wKwZdjhT/BPEGzJrSrX2YZDWhc=;
        b=vD5BGWdgDI3x4zgYjbPh7A8JqevKu0o48qgIUvwTsJpLK2lOnVf1eFacUMMQ/hqJx6
         +WPXPgB60H4Lp6BbfVf5hwMWOPaKeJpJ9NvW1/Q+6b37SZXGApkaNv47X/e1m8Z7bSot
         71WV9BCmWGxWhrBe+extw8XAXRXLbJ+Uz7Gn2bNreYZ/JDgpnZpyS8wbMhX9sDb4TpA5
         V/kJDPkuikPV5Rs8q1BC7EC+4qMZ+G8aW1rJPFniuPD0i1kSs0dtrykXd2+3bzY402z0
         pe4/deJwVBOrJPRBB6/g8XSPxWF5z65lb3oVErp2AohrN2yaqTWLHNOePUT3xrCxfkmp
         VfiQ==
X-Forwarded-Encrypted: i=1; AKwUvBykECFEDaNQYV5sSwq+dCfyA47qAfuSn2z+D4aJEKxUWy15393OdT0tkHS2sfodLRfWcynkAoEbgViYo3fJtJFKvzg4@vger.kernel.org
X-Gm-Message-State: APuU4Z+uCtxXahX2CFxioBHKMNzv9R7MarOciW6kofZFWVA8HWAqfgLu
	AkPp+wWvzcLuNKnfjtgTuu30FeIG+nX3RckN84i74awh+n9YGCoM95W+
X-Gm-Gg: AYBFou0s3VRoFlVZAStKpnjE9i+G3YQ1fyW9JnagDJktQdaIxzuIVoCeVxj38+IYDtt
	w+tkCK/s/pCD6ipY4YjslkGJMzkeC5D0ti53Y7D7cONB1Q+yc/fm2UVudnjeiwqAFU/bQGfQW/d
	du2txytX/f3jyNLqN2e7XVAxO7UesYP+e8Duf9gQ5haxKtzJR9PmQybcvI70+J1uvPF1r/mhRXf
	H4bi52GRsyvlGM/JAt4z+9az3AKqRe9SlMksyQL3LjwI2Bo01DdceeVeF1mngqz9j5m0fDUCPF9
	Bg8q7c+qbYYCd6eF4CXA/reNDRjoAvz1zzid3WIdVRarGaUq1vj8WCCNlVE4OBbu++6lmL1o7ua
	KRrhOhnQOgKmDXTIK6UX5pFmpX+wwmARFBOEvri+ZEpMSh9cJTASesxrPQ+d9SG6N2+SvkBBZc+
	HBpiOnSLsJl7Chs/+EedVp0NAnsgrlUNIGO2jm3XnGUSv5TYvjZi8VppLYXPl/OjV3pIu3ff2SE
	gUWdQdqamtRPiEWgn+tFpcSG7SoFgD3dpb7uO4id4EekrVjxHzRCGzmCs7P8rNWwSpwPztgpfyI
	z8pLWtrukNUw9hkLjjnlKQkXktGjwI5OJlCjxHFYwwtunDHlr/p4zyd0Nv9PoUV5Vx5s
X-Received: by 2002:a05:7300:824b:b0:36a:1c75:8ca3 with SMTP id 5a478bee46e88-36a4221b3b9mr19658147eec.1.1793736274072;
        Tue, 03 Nov 2026 12:04:34 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm368905eec.9.2026.11.03.12.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:04:33 -0800 (PST)
Date: Tue, 3 Nov 2026 12:04:29 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>, 
	Corey Minyard <corey@minyard.net>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Sebastian Reichel <sre@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/8] i2c: docs: update i2c_smbus_read_block_data()
 prototype in writing-clients
Message-ID: <auo-JCn9VES7OwX5@google.com>
References: <20261024-i2c-smbus-read-block-data-v1-0-19bb97467982@gmail.com>
 <20261024-i2c-smbus-read-block-data-v1-2-19bb97467982@gmail.com>
 <auI4Qq1KUo7YYVtG@zenone.zhora.eu>
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
Content-Disposition: inline
In-Reply-To: <auI4Qq1KUo7YYVtG@zenone.zhora.eu>

On Wed, Oct 28, 2026 at 07:00:49PM +0100, Andi Shyti wrote:
> Hi Dmitry,
> 
> On Sat, Oct 24, 2026 at 07:48:42PM -0700, Dmitry Torokhov wrote:
> > Update the prototype of i2c_smbus_read_block_data() in the SMBus
> > protocol function table to include the length parameter.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi, so will you be picking up the patches affecting drivers/i2c?

Thanks.

-- 
Dmitry
