Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D4128F4
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Sep 2025 04:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688330; cv=none; b=aD5eF/etCur4ZPXd7buYjewbsR2TP+V6ptontvkgL6n7SmaaBkmZ0mxINmVegDOlee2XdlQ0gfKjuWgAjTF1FwqSJA5BDo3pAzlIR+s3v7wN4BOgcq6NP/AZCJDfjLaMtzJKj4aGwrpOp99EHFmk7kw9cMWHc+LvLRC9tPSvy6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688330; c=relaxed/simple;
	bh=N+gkGHczie4nnKntZBVW8v1uYxKIbM1r0W+/++igDfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SnN2RbydzM1iH87IJ5RQesSLN79cUiZeXdFp8D1ewNn8vIfTEVGXiyRFYUQuAh0eD8Ifs3lA+qHcTtQqKw0P+4ydA+YppRiJQho8UsHYdhsvHeYZhIPJWTRuQeJIp9jw2bhn+k40Iw3ruc40sEESGDQ7DLadFD9XOKUpbqDPqxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MErylRYB; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MErylRYB"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-54a8f6a2d80so1605363e0c.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Sep 2025 21:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758688328; x=1759293128; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N+gkGHczie4nnKntZBVW8v1uYxKIbM1r0W+/++igDfY=;
        b=MErylRYBzK8jxUKufKAb/lqC0r/nAoD1V1AkGDcM6s/RoNGAcxQsM8meesVyuGLvFf
         m4/CbjFXJzEk0LeABOz8PZ0yqZXK7szGmVE7ndn4gT5hO93C4FCwChf6LPuLb1gJDczq
         P78ZJpWAhDc82FkLz3PZhVRAngNk2UKYOlot8aWMijj5MgRMbNCPjQ/hxwdFTkjMTITR
         o3xbYYVBv8uEixgkAD/r1gwKVSeqY4aIld+NCRlH4nT+ddVOk060qIWJwrY5K8JKRk7O
         sL7JOykr5lg7DAbHPYQiBpD2AFrdbuaGJZpaPW8wikTacaiWZpFKjDoREwAvynPylHF/
         fhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758688328; x=1759293128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+gkGHczie4nnKntZBVW8v1uYxKIbM1r0W+/++igDfY=;
        b=wZr5vWNDggSl8uBIvjvrPP/YT9tP57zK57ugFY0gD+0G09+ZXdKOvJ4MXbyqnPa/aE
         dmIXSRgYdqCFCA/qSIuhUy929+L57YkWG5A+wO7VN8lCNq090l5wwviLL8V8t18N19Ph
         jbfhW11+00ZFd8Sgsj3c3iy8PMsZP5oz1XMKUcrADcvxIuM7sgwe3v0qjYuH4Srn9Fnm
         Xm06vd3kk7UkHvneo0Yg27EFndSdg+xir8/c3IYU9r9EDe0RLqokRztimzCzwADE14bh
         6pfqTFTSGHZJwwKrhqJD9/YyD1vapWv5drCLOj1JjGCVrbZxzqc/GL4VryCjUeyRUa5s
         oCLw==
X-Gm-Message-State: AOJu0Yz3Y6j54RgLGJLNuAk01IH9ekhVQBC0IXLk0MtAFR2MbPYn3khp
	WT+tlf/AH43qXjD9/P6xambGKN1Uv8EvFg9o8kOg/+0XRvpGbezewrjxo0SST24UDpDKzPWTG8O
	bKSS13kq4/+kwzKISnXM1XLqpu67LGKVI6bHC
X-Gm-Gg: ASbGncsFhDdpwHq1yUrf+59WNRqzjAOPKfJ6LJ31av+sD1f+alausHJs9z4nsfUgvuJ
	hCa99vpTmUKbWWXy2sohyWvImJtLVyxRNNU6kgpLwl7U89YBEYnJ3E1bylgUOV9zqRRGUeWddZo
	1htMNPCMI8G3aF/ajls8XeyIKkzE5P28UbKxAxaiNxyWLr8M/XUfsO+nJnIgJpbtOTk/EMgyL/C
	yTnEwG7S6sfd0r/QJw3Pd78wK0moBKUUvPCEFVP
X-Google-Smtp-Source: AGHT+IFZCKRRj53RAoF4Fb7EBOjd74bZ93rn9SgEIuzMPXYezKaUYSXyUHo6qmTz5CpDRFNIeSCzDrGcaGV/bZAwkGU=
X-Received: by 2002:a05:6122:180f:b0:54b:be27:b541 with SMTP id
 71dfb90a1353d-54bcb11c332mr1307189e0c.8.1758688327688; Tue, 23 Sep 2025
 21:32:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE_EmHsRBLJauuYJinTaf=Q6MzexHWti2SWeX8DWPmF6FN-aNA@mail.gmail.com>
 <DD09CP8SI4S3.D0SYL9FM7MR2@gmail.com>
In-Reply-To: <DD09CP8SI4S3.D0SYL9FM7MR2@gmail.com>
From: L Lawliet <kmtechnical2006@gmail.com>
Date: Wed, 24 Sep 2025 10:01:55 +0530
X-Gm-Features: AS18NWD_TGv1LzrsuPZVmhj1XMyrQpG6eLmer_TA0Y_IyyYp_6mVRUASn1sXKhE
Message-ID: <CAE_EmHtuc0RXyM6EwK2oF9Gm8h6+9bydWGBOwdvTi2A=4+hpbg@mail.gmail.com>
Subject: Re: [PATCH] alieneware-wmi-wmax: Add AWCC support to Dell G15 5530
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thank you kurt for the review
I made some silly mistakes would fix them as soon as possible and send
a canonical patch
