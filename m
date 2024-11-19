Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10A51863F
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Nov 2024 03:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731988057; cv=none; b=Me5fcDiAvSBtGhm9pSAQO7d0SkC+nqY5got5m9z6pmlxXNHwqsJUyoZjUbWx8qGDpl1eAGrKkKkC7CpgEUln2tFiaNBh/UD3WiNDQSc9EoMCPZjjantAWQupWsgBWe6wPnuXoduk+y1p6p4jQdHANgh16brHK5vf9nXdsj8837s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731988057; c=relaxed/simple;
	bh=llanw/28nVwLKleOOcc3cRUs4V5AFaXaZGnr29iaZj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VhG/d25M6TtkYKpSXfN4v9CuS9W1z4Wr9qKVoGlM3pSZyonrpkLPoPPtvoKy/C7Zye3eza+Ush+szRaQHX+fY0fpGKBW9igpF4CHZ7wnrh3/Rmg1HYawU3MlZ3J09EwudKoSaqZ2r5Z+M+iCw/BPAqtU/7TANXpx3NZSgHFId/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZaNBX/nb; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZaNBX/nb"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ea1c453f0eso320676a91.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Nov 2024 19:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731988055; x=1732592855; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AQAyiTAdDfFNOeVJJm3BU4PSuDjQFwgHxnavmPJW4Hs=;
        b=ZaNBX/nb089aBMYO4bG9ryj/KAGpwvFJGY6j9kq2JUak/KJySUY++uI+uzXahCIWBT
         ARbnTdLGZmaktK5v2SxgyhA1sn/ng0mrTYW1542lM/lVsLtuLZzAnIyaUV1aIwLiXvWz
         ztf1oQTKOm3rXPhaqbZKIuJhx4N0f6mW8m6CwBqkIxg+bz6guftCUcLJ7gPb6z8N557c
         955izdrtWOokKFQuaXQN/YsNpkzG3qxlE6HznPZNkELWdJh1HDb6Ahp0p0MpO8mTMs3X
         /dVojxBrb4j1K/g/2HG9ip7bBXhSOAh/TUb78OSrl4H4bduokIzx7AJuenXfAMwpQMYl
         lyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731988055; x=1732592855;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AQAyiTAdDfFNOeVJJm3BU4PSuDjQFwgHxnavmPJW4Hs=;
        b=as+EO1H4/g1/49O01DNagr5c61UdSE1vS6R7tfI30AlAXhv1hF13Z17TSs43SWoqaY
         7mk4iZjkCsiail1+o+1xIj2CTWq0F1KL1PEIgPgCF0Wu9OfjGtXRlOsASp583oyJWk0B
         F7RW6v9omLw/c3uZVnl5VduzzUt8jbnsrPcxl5twGlT1D56d8vwmTOYsAbL++DXKxlY5
         cJxH29IBk3T2Zm54IqMjUgkO0KF1urHYijzmgPQE8oaB4BCSbGnm19YGZyO96MYYJIIF
         5dbp4bO7PJNBWa0XcTg2ixmVbtS4AROuuhpO/0U2MnYe8x6K9tOpZMEjdoznDpKSchJm
         gmjA==
X-Gm-Message-State: AOJu0YwhbUmR2et/ALgSkzK9jz+iUJUdFrPVLIJ3IyPsBEM2vhYgJERn
	Tt85D09j+BoPse7tm01xCzcjsjCEQDl9IhxtlpdPNRPMmCPDiaxdGuvscMVj
X-Google-Smtp-Source: AGHT+IGWjdZQK7LiozQv6EE7AuBe5seT1GNkoQUE3E5QFnrWxcNGDEY9Y1HdD55YHBj/3EXzpLsCJw==
X-Received: by 2002:a17:90b:2d0b:b0:2ea:b564:4b3e with SMTP id 98e67ed59e1d1-2eab5644c6bmr745103a91.16.1731988054631;
        Mon, 18 Nov 2024 19:47:34 -0800 (PST)
Received: from alphacentauri (host95.181-12-202.telecom.net.ar. [181.12.202.95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f36cafsm64997795ad.149.2024.11.18.19.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 19:47:34 -0800 (PST)
Date: Tue, 19 Nov 2024 00:47:31 -0300
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: mario.limonciello@amd.com, ilpo.jarvinen@linux.intel.com, 
	w_armin@gmx.de
Subject: alienware-wmi rework RFC
Message-ID: <6m66cuivkzhcsvpjv4nunjyddqhr42bmjdhptu4bqm6rm7fvxf@qjwove4hg6gb>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

I'm planning on migrating the alienware-wmi driver to the new WMI
interface, as it's currently using the deprecated one. My plan is to:

rename alienware-wmi.c -> alienware-wmi-base.c
create alienware-wmi.h
create alienware-wmi-legacy
create alienware-wmi-wmax

The last two files would not be independent modules, just includes for
the base module. The base module would be in charge of initializing the
platform driver plus the correct wmi_driver backend, but the wmi probes 
would register the platform device. This would be very similar to what
other dell drivers already do. Aditionally I want to migrate everything
to the state container design pattern.

I would do this in such a way that the legacy and new code would be
completely independent of each other (i.e. different state containters,
dmi checks, etc).

Pros:
 - Modern interfaces and design patterns
 - This is compatible with Mario's upcoming platform profile changes as
   the WMAX device would hold a reference to the platform device
 - Would not break compatibility as legacy code is independent
 - Easier to understand and develop in the future

Cons:
 - Initialy alienware-wmi-base.c would be almost completely legacy code,
   as new features don't require a platform device (yet), so
   alienware-wmi-base would basically just register the wmax wmi driver
   on newer machines
 - With this design users would not be able to completely exclude legacy
   code with CONFIG parameters

After this I want to add HWMON and sparse keymap capabilities to the
wmax interface.

I'm sure there are things I'm not seeing so feedback is greatly
appreciated!

Regards,
Kurt
