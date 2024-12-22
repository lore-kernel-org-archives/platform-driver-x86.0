Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424F413B7AE;
	Sun, 22 Dec 2024 08:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734856948; cv=none; b=hoErzLanM05uS/aZBb1DNXcuZjt/RLjxfuMYVRneujTxqsaMs0jOChu2VVMzHgS5k8rrKdMZZpu+pAFCyXcNqNgdZsavlUw4oHwqWN42ersKcFiUJ5647VAtQxYgLzlMTlZ6bacIGE6rj778e8UFxBAdnRjyfWgImq3PwRop2ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734856948; c=relaxed/simple;
	bh=qeT3sFvYjSq6N1za6dXxSbljCN0r2s2+MUE5KdJ8nOE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tQcKUvsFRuQCk8cfR7SS98vLS2qqK8JRuWrnqfW60F4sfDuErDppVXvR/P8bRWHBVWu7A/9bsJiff1e+n+CXnzl8xMe2VaM1uaeFlr/eiTWocHvJB2QkR/xKSW10ewFmszb8h/PXOKIZbZ/LtfLVN2CZRKRfAgBzE8/P74c80O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9tMbDMz; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9tMbDMz"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d0d32cd31aso4614792a12.0;
        Sun, 22 Dec 2024 00:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734856944; x=1735461744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FeYmHqbnjLNyTT3j012+iGXpYh4HXdGoYtptCwdfkUY=;
        b=f9tMbDMz4DOx14AB0ZjrawyqXFXFQwg3u2FznZLNjuPjHLmorPs7svW7uFyBiC7x81
         OPUYBs5QUCU4gZoENJt7H0YkeKwR6CRTXbqeBmY0LpFXqAgynt2HOJGWNivo/guOjsxa
         IBLM8QHDozKIDKFhgjzKgl6155TEyo8bFDYI3KaXWGszc6vyr2pPpAF7LLDYR4qeGlEL
         kqcLg/YIMVj4F+TA80gCpOyEYkLs/TkkoDQrK1eNLlebATDnzq5OKUQQy61WgojV9Olk
         W0npmRVWUovoNI6HPfujSmPdKBnVJAykmKjkDl8F1d8NkO4VnV1e9NbE8n9Iq0DkUHhS
         Ub0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734856944; x=1735461744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FeYmHqbnjLNyTT3j012+iGXpYh4HXdGoYtptCwdfkUY=;
        b=tBHXNI6/K+49ItKc/sFFn3QdIE4QgORoey4bh4MFkCq1rAwzNuCkj4SMlz2DcGfL0A
         Wv1/D4NuV4hvfXPoJlczrkVPtvRYTQ3g2geJY51I3RNnv7cnSadydqOZGjkiTFBw2wSw
         2WzNJgoVa0GszhkF777NDIlwTlV0mGoB2cni48NlECkzCXosfXI46k8y5gunuHdM1Mtd
         plqOANM4MzZuZzgzUgqBrWa2/LS0n0mgH3FoHI7uLi2rfD/UGbY54HhFH43vHbU8jfcs
         dh7QzIoVV7d9VCXXvpe/+cLDh9s3S506wwbrVbfndig0lPknhu4EDU+lFW1IbVC98Hf3
         IagQ==
X-Forwarded-Encrypted: i=1; AJvYcCU60XqoOJQAFZZBB1h40eKSaMPImWDHMgcQlMQhftDP42p7Evhey477ynd416zkrK9/B/qf6yM4wTc=@vger.kernel.org, AJvYcCUqx8ILqy4F79daUGsCEaCtYbaQuIxhj5PZOU0FkeqJAAJQ8k4P78OjbU+ianN/+5ABObwsO9GtKi3XO/uOblQUpzQlUw==@vger.kernel.org, AJvYcCVqkBHOlolnYotVkUzSvvLgCQNhbs7CwjfSDD2lWqi35eEG+DaMNNlML38b29ApnOzu601yH6ZBzKykORT8@vger.kernel.org
X-Gm-Message-State: AOJu0YwGa2GH25lefISi2RYuHDrHREA61XB792aDXya3scNGxvIUB7uE
	TuwvzWYK7NvQL81ATVefRPpQpG1y2IlDMbmFlRqmFKLx1bmpCybY
X-Gm-Gg: ASbGncs3t6HiKDQPfkxVphFhhXUiFHysw9L2ZvgQ8uj5KH/yKytBwrMYuZheVamZ9Pd
	SoUyFmwUncwVMobDxgoZpwX2ikwap4oeuHaXxLTLeCSJFg2HmMChHoRAIzz+xKlCqPotl+bKGLP
	rs0q1FC7yfM8MnCkJzxT1Xhqo4q/4p0XppXBKjNEm62mNI4CxCr31E3rZ+9Xd9mGSOtUsbfhUZA
	+NMNlZGsWtXsPOCjSi9tEnE99T2le10OqUVlUE9dprCf8Y52L5Gc9A=
X-Google-Smtp-Source: AGHT+IEmLIl42hgBKyYWMA1CgsCxga4hy8PmdH+a/UjzxJ79eI8CASFNWdFMJCq2de4euz72lWgSTA==
X-Received: by 2002:a05:6402:2550:b0:5d4:2ef7:1c with SMTP id 4fb4d7f45d1cf-5d81de06532mr21258493a12.24.1734856944201;
        Sun, 22 Dec 2024 00:42:24 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac5:27ca:2a0::43:6a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f073333sm360112766b.203.2024.12.22.00.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 00:42:23 -0800 (PST)
From: John Martens <johnfanv2@gmail.com>
To: derekjohn.clark@gmail.com
Cc: corbet@lwn.net,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luke@ljones.dev,
	mpearson-lenovo@squebb.ca,
	nijs1@lenovo.com,
	pgriffais@valvesoftware.com,
	platform-driver-x86@vger.kernel.org,
	shaohz1@lenovo.com,
	superm1@kernel.org,
	zhangzx36@lenovo.com
Subject: Re: [PATCH 0/1] platform/x86: Add Lenovo Legion WMI Drivers
Date: Sun, 22 Dec 2024 09:42:16 +0100
Message-Id: <20241222084216.1420666-1-johnfanv2@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217230645.15027-1-derekjohn.clark@gmail.com>
References: <20241217230645.15027-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Adds support for the Lenovo Legion series of laptop hardware to use WMI
> interfaces that control various power settings. 

Note that there already is a driver for Lenovo Legion laptops that I 
wanted to merge upstream.

https://github.com/johnfanv2/LenovoLegionLinux

Compared to the proposed patch, it has the following
advantages:
1. already popular and tested by thousands of users
    - many stars and discussions on github
    - patched into multiple kernels of gaming-related distros
    - packaged as dkms module for almost all relevant Linux 
      distributions including Debian by other developers
2. supports many different Lenovo Legion models starting from 2020/2021
3. supports a lot of more functions, including fan control, which is the
  most requested feature
4. supports the many changes between different in the WMI/ACPI method
5. actually shares some credtis with persons who revere engineered it :)
6. support by GUI tool to configure it all

On the other hand, my driver has the following disadvantages:
1. The version of master on github is the most recent one and contains
   a lot of debug output that has to be removed (often indicated by TODO)
2. It is all in one large c file instead of organizing it neatly into
   multiple files.
3. It was modeled after the ideapad driver instead of the newer ASUS
   driver.

A few notes regarding the many changes of the WMI methods that I tried 
to deal with in my driver: note that in almost every new model a new 
WMI method is used to control the same functionality (e.g. fan control
 or powermode). Additionally, often the constants or the unit changes
: e.g. percent or rpm for fan speed.

> The driver has been tested by me on the Lenovo Legion Go.

The driver on github has been tested by thousands of users.

I suggest that we maybe combine the two drivers before merging them,
since Derek seems to have more kernel patching knowledge and I seem
to have more worked on all the Legion laptops.
