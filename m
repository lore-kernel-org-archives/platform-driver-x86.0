Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C22517A2E8
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 May 2026 00:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779409564; cv=pass; b=XFULVlDRmMwNPnnSWAE855fB/Xpqfk+sbbBCc8X6NL5NzB+IkeWrwCkjxYLVoRmlotM2d3MdxYO41b3Wqahy4o0aPMqX21oGWGidx08PKY/vV5Zkhi4Bg83HWRFj5RJKm6mFRDSHv7rSirGkbmeilUXngzRJMBJYnedLBfjtHs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779409564; c=relaxed/simple;
	bh=xyvBozqmeDnAhfJwJKTn4YOm/W/FEQTzzbGYFTNYBWA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=e7JonL7Ak9OiGoxEk8hNMw+hvcaMCLZtG0iLbhRUlI0+P+53jhEwf05BsS4gbxOhr59ND8i69iYOxXBfvCtH4Bz7VeXydfehU9j8ONydz+9v2ut7ZInrK9EuVoYu9ReYRp4LACkLewPGsh/ZaqONpbq+zBemo0aqTprLwVF36cY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAqPLvOG; arc=pass smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAqPLvOG"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-36974220e45so2851391a91.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 17:26:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779409563; cv=none;
        d=google.com; s=arc-20240605;
        b=HQSDmmGyDPd+1/TOf0WvgEZqNG90He7pzqg3HoUh06ehfGm7Crv4dfdpj1vx0JFvAw
         ZMnLiJTEiL8SnTMfv43HVfNvje3DRUBUNipkunVeuQWCUsKxX0PILiEKEBFFAz0FieOv
         XLZy4CMqha09PlgETGr965OcLbweegpoL13foZJQDXz+oAxirW2ie58nQ6zGO+rRZbXc
         Bk9rPe+xpSDaiTnMeldJ4GHWrsozoq+0BWw82RtLs9VnkzatGOv59Y9oM0AH5guyR1vr
         uJhiRS/jX9qVE6vbT0NY6pSxmq7rtQVr5Sk/oeo2yet7RZkGT0d9hgssmy/fZbCAQNXB
         DcAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=xyvBozqmeDnAhfJwJKTn4YOm/W/FEQTzzbGYFTNYBWA=;
        fh=UGqodwJugHJsGTpxGQZt/V8Mb+wFi4vuDDdrZEjesZo=;
        b=Esf3xtrn0kBxO6GQ44xs7PKUm89uGK7rtItK1S9ex11UWtCU9TrOPQ+FSway5KbVDT
         XBR2feCruRFmOIirp7Qv840OPBi8JWy/PWg82u+y0XnDt7bMe8P+eWayfko5zazWV4dS
         mcCxmBYP5RM6qnnYmxfV+2IsSTu9rmoQVdRd1ZpXFSSLPAsJA3EZynQRBjZJ7mVgOtr2
         jAsJkKCpid9U4CT950z1g4ZND9gUrV1c11l3hOkOYZ3RNO/9ePHEg3Sdwu6pbCpW7YcQ
         GThfa/NOar48jGRjAujtmcZCKRqSLkaWR1vXqz/uJplRSZC/T0clYJBTYVfM/MICCNYC
         BK1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779409563; x=1780014363; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xyvBozqmeDnAhfJwJKTn4YOm/W/FEQTzzbGYFTNYBWA=;
        b=HAqPLvOGzIRflS88M9LDsrnf6M/jpv3o5DxnbVuFy5G4V7I51o0WFn/TSAEX7LaN5U
         kHEjCPfIxK/ezLh5yijWi41OzrNkGfNyxduRyC2GiOlS4D1cy2y5SHRZsN3NPCkdBcl2
         dsVhRo/9Cp1+WDt53H88EQ8h8JOJuaEl5KHk2Axj7EKHcdecmvCSvXWcHwQYjlaSkj1d
         gnch1uKIfTGvchyNfL731xSE4/bVi4xTYPqZjvCcFdXTJuIc0aVXilzEls6sUeMDGw3S
         95PkWlTWg77kV5AZmdpqurXjv39dm1lYcx8tdYKOq6BUFvL7rGwkqg+ZCnosKaAbu2LO
         +iKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779409563; x=1780014363;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xyvBozqmeDnAhfJwJKTn4YOm/W/FEQTzzbGYFTNYBWA=;
        b=rR/wGFJlF2w0v4uqKaCatfJvJ91zgGAaV/spotM7i9qjQq6jaC6hIFngcXZ3W57ro5
         BRz7B2l5BnaIlak4La7+22QAIIM9rpzyD+0drM+VAnKU7wrmwdCfTFCbpq3TnZjyCdfc
         AtvI5RUV7jSrOAzFOYQtiu+FvWCTKTxPfvfFJhWcx9dhbrxLEYFJpaUx4kB3Ox6dlCQY
         wDCHcCTqBXitO8US1WfsN+p5Z3/yhCtpycg1BS8qHhjwmN12ysHv+oZ2/pnMaR0LQ50A
         ELRl+VxCfeLYeXzxW7t/mGo4fUFHiMFmrshZCa6KZ6p+2/wBr5MXbsqP+uTwZY831EWW
         3FQw==
X-Gm-Message-State: AOJu0YzXXOPW6Ap13JLrs+ZIwneXb0zUaDYJCd0OQrqdkVkdSB33hYRS
	lEbittmE/8Pq+lksHRuBSjmti8dSHvFdjjudkHx7W9dpKxq012RsptM9TtadtkyrmU5bVK6HNsh
	afDlAdVZQgYObEsGn/tjbMxAf/6ra6lg2kA6+Jwl2N5u0
X-Gm-Gg: Acq92OHBQNFzEzmWAEx5n0SoDH603wbX8Ncl4i2r44WHRPVcqJZgGNtA3lKpym+mhzi
	b3uIMUBYiA4etFURIlEeQQqmWBAFMDrBq+oYBFlo9YXXCQMs5noQp0pAr5nA/TCm2/Ga/6bhcV1
	0gQnlgiQeugqWApuBbLSHxWkh45T7EvTBz4QqZXr+fZpJ5ZGOC/05gAQPAc2V/GrDg3ziJExlyX
	gBlYax6JCrxH+cyoJgzzDmFHAZDTNIcYkqOMZRQzwHMAulsW2sBw1NjmVYk5lBSYDj3BhniZhdh
	ZCdz4NhNp1i3rTlzrTa0Vvl0MQ==
X-Received: by 2002:a17:90b:560b:b0:35b:d795:cf5d with SMTP id
 98e67ed59e1d1-36a6bb5b91dmr762547a91.5.1779409562627; Thu, 21 May 2026
 17:26:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Gillian Laurenti <laurentigillian@gmail.com>
Date: Fri, 22 May 2026 08:25:50 +0800
X-Gm-Features: AVHnY4KvERgImCk9CkFYekCzCkfxUFN6yJpWUKIfndhUTn5U8h09A-p3wzxjD3M
Message-ID: <CAB4tWGWi6GjU7WrPzaPMRF3gSZ4zrD9xDArbuGcNMwYmaMWCwQ@mail.gmail.com>
Subject: ideapad-laptop: Fn+M (Touchpad Toggle) not working on Lenovo
 ThinkBook 16 G4+ IAP
To: platform-driver-x86@vger.kernel.org
Cc: Ike Panhc <ike.pan@canonical.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,
The Fn+M touchpad toggle hotkey on the Lenovo ThinkBook 16 G4+ IAP
doesn't generate a keycode under Linux.
Pressing the key only triggers a generic WMI event in acpi_listen: wmi
PNP0C14:03 000000d0 00000000
Since the ideapad_laptop driver already handles these 0xD0 events by
reading the VPC status register, I did some testing on this model. It
looks like the touchpad toggle state is mapped to bit 6 of the
register.
Can we add parsing for bit 6 on 0xD0 events so the driver can report
the touchpad toggle keycode properly?

System Information:
Model: Lenovo ThinkBook 16 G4+ IAP
OS: Arch Linux
Kernel version: 6.18.31-1-lts
