Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AE523D2A3
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Sep 2025 06:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758695250; cv=none; b=ThF7lxGw0jZjmeRy9q33QN3jn3lQFWkzNc/+V+MuYGq5w4uRoWw3WvlgYU82VXPPe3kQS0o6Fz39gM+CXSc54fhuqt1rUrKRWvfz6ZLI+JFjlNAR1stnZhy4/xev1WY4hVRQbwlKFNgfD5p6hSL8B0+F7A/fXLMQrGujy84qB0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758695250; c=relaxed/simple;
	bh=EjNQACVX1/WwS+nnG382QgH0CHD0sgVWkXQUgWFy6Mc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ohB0mxX5YYMfHfRRy3TZi8knn5TAkEngA+QVOsFx34O3e73Plug9BDWPN9ZXEeNH5r0B5SMAWUIGVOEiVHNZKRZdP1mZ2FqzQcE+TXZTgAGE8ZplMTxet/otTQkhkbtrTnSX9ZV6zCxkIRb1stQekFP01QNV25KVRG6XwczfVdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trix.is-a.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trix.is-a.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b55517e74e3so3353996a12.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Sep 2025 23:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758695248; x=1759300048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3y7UjKZt18M9dKS6WzD7HSdI/+Z+TxKSqTMRbxOdk4=;
        b=Sgh2jmeBDywckKDkHEKKyZLNIr0T8LpBTo4WUvkkETh7OUyf0TwQSkncPAAL3kQqyI
         gttc/9b/IEM+kSh+m+O0M4BWDTHT+UFjwfLwTm+v+4vCACANQi2VAsZTZ0YFRmeQNpVt
         3BhNMytrDS7eupsXDyRhhnX0Ka7wDyZt3TRkb4H6z91fzjYhrNe0/FtV4Ro2mkA7algZ
         +iqQLLan2mZsUgKBMyDegqLEm2ugXcVR2gXEbY7ifiEkPYvV5rKufIKC3GL9vXhVi7jd
         OkY2ntxa6xWK1joQh+0SIFjUK9QdKpiFqAlL0Q8QRW/Ct49kA0ETr31+KjPQS9mhaJQn
         FI0w==
X-Gm-Message-State: AOJu0YwlxK6TVwtDt2afmlC3QHDfzvu/VMEDZRQWnZLw/LhextdFyMvH
	gJ0HbaQjn183ElnskwCL7ye9pYpkGONLwHCs8ej23s//ffxuCA6coLc70XRQs4Ayxig=
X-Gm-Gg: ASbGncsW5TBuEpEgVBp0xCI1QwOK3p299dqS+zh3HogaBU+bsyC36CnaM6w7GjFXDVz
	/JRupiBn9zCNgkQ6ZHJY1HUsWM0w/pnraJZLV7QY8dbTup/MQz6mHV5iaRl1gWSb84pWRe+0G17
	YzccocqbCL+01w7MLQ8xA3pBbWUfendqyaLd8wRwqff/79J99cWlkl3iM1OJ6vRnFAnaV817SoC
	A2vLSIctqqDLutHeAr4SQy93YbKKUUq5gvBGrjRxH5gvHGk9Sq4bb6O1OV338vaqbGHBNBpI7Gv
	PU9QpH6nGIhob9wGUQz2z8TBeh/jfPEdFUF+BFELIBIFgH3tp8aLNOlhj2uTfezZZQRYAhYVibH
	6K/3QuJldrftZl/jZzZCr32M=
X-Google-Smtp-Source: AGHT+IESvWyaxhrb1GE89Jvj0BCA/gI98078cat8fJ2JJWOPFr7lPYcJ1D1PKmb8LWUfUKtMw86A2Q==
X-Received: by 2002:a17:902:e5d0:b0:272:2bf1:6a21 with SMTP id d9443c01a7336-27cc1853968mr63831735ad.14.1758695248329;
        Tue, 23 Sep 2025 23:27:28 -0700 (PDT)
Received: from archlinux ([2405:201:6804:217e:39f7:e9ae:d6fb:a075])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c081sm182094155ad.41.2025.09.23.23.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 23:27:27 -0700 (PDT)
From: tr1x_em <admin@trix.is-a.dev>
To: platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com,
	kuurtb@gmail.com,
	tr1x_em <admin@trix.is-a.dev>
Subject: [PATCH v2 0/1] alienware-wmi-wmax: Add AWCC support to Dell G15 5530
Date: Wed, 24 Sep 2025 11:57:20 +0530
Message-ID: <20250924062721.209621-1-admin@trix.is-a.dev>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch adds support for Dell G15 5530 to the alienware-wmi-wmax driver.
Tested on my own hardware (kernel version 6.x.y).

Changes since previous patch:
- Moved file to correct directory as requested by reviewer
- Added Commit description
- Diffs are now from base pdx86
- Fixed formatting

Addresses feedback from https://lore.kernel.org/all/DD09CP8SI4S3.D0SYL9FM7MR2@gmail.com/

Thanks,
Saumya

tr1x_em (1):
  alienware-wmi-wmax:Add AWCC support to Dell G15 5530

 drivers/platform/x86/dell/alienware-wmi-wmax.c | 8 ++++++++
 1 file changed, 8 insertions(+)

--
2.51.0

