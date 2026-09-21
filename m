Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD314A68A2
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 14:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001784; cv=none; b=g6e4kGoIgjJrqZ6sd6vWfzr8/L37x+Wj7RmbWf1/Cck4uKr4ujn5yebBbq4w+0SXnH+g6ATdYQtHc7tR9vJslc70eEY3I2BqU0RnuwdveYvoYN7qaCL6vShB0B5WgUkuJFPNhoMtbuPb9ylPlXiIK9/DPWZ1IhqBpwsy6MtZJ78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001784; c=relaxed/simple;
	bh=ee6NNdwpIoJbHKA0a/AD9u5PEHXwKj964nGJAAW3SH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fIMKFhRqbNWMdiUxb5oWSHBf3BQ4rPhPolilfbsRPZSFE/wHeYsRB45YXh1mgxTi820llgJ8v3erTG5nwvhkH96nrLUd51OjNJa/nGIBrCD74My2C4nRRwJbyJjmfN7ssSS1hys0lP59C6nDTRHstNeXAWSIKma0CIW0Mu+mcVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqbeFuiC; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqbeFuiC"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-86b90133ae8so2209151b3a.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 07:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790001782; x=1790606582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ee6NNdwpIoJbHKA0a/AD9u5PEHXwKj964nGJAAW3SH4=;
        b=AqbeFuiCjU1Z+KffyMiRh8sQuC9I2hgq2u4T1lSTcLdrgP+0pKhDPO+i/+UokhXt0c
         NkZPID4wtxHd1Tqg3RdRLybgPcdnXHzDHGjWxY6a25pjUCctVtMdvu5+nhPuNw5XcjLT
         ewcOePPwt68bcg6j8hV9e4jufUTdg1QcB2f18MvILeeF4qlu6wy2YlQwQV6gYUvYae5V
         f5L6Ry6TSXACqnHZiW81mJJh+4WPHdCRtC7EUCofIgJLQNh/bELw/1Bm+JExTBKJpNNJ
         e6dLEk9FNFPIDVpoeO0QaZg3AFUXOHrElcVeF8R9kvqld4zEUtIGNC1UyvL9RtLE64g3
         22Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001782; x=1790606582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ee6NNdwpIoJbHKA0a/AD9u5PEHXwKj964nGJAAW3SH4=;
        b=x5xHXf2ffDHaxV8tUo5juNCflq8ZRxHzCdHhBBPzxsR+ijQSaP1B7MG0aqpdS5TUS3
         14j/VT5C9To31z03bbQ/lP8OEbyXXw6SnitEc+AExcYB+OPbOu1DNUKLsR0F/KQkn1b6
         7E8NjFGlh0yR7JUJmiH8w6jmRgYC61eCJhkcBF9s73JG/6Lb4+Lft8II6vnQVb1ZS3u0
         J1BEnc8QOQXD1L2qYT7elWmZ7bJGTapOProZRbtdqJebTnG5Yp+Uyc/0kDMyLnvXig8g
         ARpab54oQfZKF3tmcrH+OE4th9N882tZAFlpDZCLaIY3AFshuyPsoAMtCCqcPoA7lgja
         WwCw==
X-Forwarded-Encrypted: i=1; AKwUvBwKZwQ9qpgS48PMdgySonT4QvNP3G61/ojIAohL3SpmbpCsX4anF2j0F1CaRNdfA4nawsoFJnWESY/0ZBqzXXIHa0X3@vger.kernel.org
X-Gm-Message-State: AFuF++naXA+R2Y7Q9X140t2dxdfKrhxz7aoIspsca7PdxVRt7S/sVqrE
	8RO1B2DVqfxLKTa6S0F88K+r3zdhbxdTfI6z69HHWtQtJoFiVZkVkgf/GFri1W90
X-Gm-Gg: AYBFou0aAR29T3xiAxoJhkZmQ8CUk0shywQFtGlSgQwZFKe7v1q8JIpAseFDpMSn7zK
	b5l2psJbzsQuaw5bNv7clEfeYzQP14aI6mHudvRfqAr0G7eZLARRGx4zTXKrO6Qa6xmUFIqqOgB
	ltM+wqntQ/xIegbaOFAmrjerwP3wZ/09cWTKYicpv60hXyuXFa9QlY+5WCaV8tj0Lgsb63Qp8MU
	fh4ex8G9RgscztXEV9eHMIXfKGb9q2dALXxMlJxtqa2YRcqvinUe8SqzMrLdeg2lzBIRIfAm/r5
	t4opncO/zHIUqwjRPUykHhkRtCkive/kH+10+HOz+j8MoHVzJzptAzkcUmP8p5nCYMurxlwIcdL
	1NJ3yIllNzdZ2bb20rxX1sm0+eiEsidt8on3xsmefYfc6gxilldg5rM7RemxviwlsJN+3Cm4fKZ
	FN8S6YM1SjKR+XG5yOqoBs3gBODRmM1RKXcfyYfkWKt7m1WDTkLTj8E96sO1fwfPwobucJLTYwu
	+1xZ+aW1Np7r89eDpwLC05B1srXL87B2gVRzsjwU2yvZjC/VWC+yA==
X-Received: by 2002:a05:6a20:3949:b0:3d3:adbf:7784 with SMTP id adf61e73a8af0-3dd8c41a806mr15005040637.25.1790001782204;
        Mon, 21 Sep 2026 07:43:02 -0700 (PDT)
Received: from LAPTOP-ULBIJHFK (59-124-193-167.hinet-ip.hinet.net. [59.124.193.167])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72acd26c6sm3704120a12.3.2026.09.21.07.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:43:01 -0700 (PDT)
From: Chipang_Kao <prozac2734@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	W_Armin@gmx.de
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	jprvita@gmail.com,
	scardracs@disroot.org,
	bryan.odonoghue@linaro.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/wmi: Move ASUS platform drivers from x86 to wmi/asus
Date: Mon, 21 Sep 2026 22:43:07 +0800
Message-ID: <20260921144307.467-1-prozac2734@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <ee3735b5-6f56-4b88-a582-5bb0aaf3eda8@kernel.org>
References: <ee3735b5-6f56-4b88-a582-5bb0aaf3eda8@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

=0D
> Thank you for your answers and this all sounds good to me.=0D
=0D
> Based on this I've no objections against this series.=0D
=0D
> Regards,=0D
=0D
=0D
Hi Hans,=0D
=0D
Please ignore this v2 patch. Only asus-armoury.c, asus-wmi.c, and asus-nb-w=
mi.c are =0D
WMI-based drivers. I will move only the pure WMI-based drivers into wmi/asu=
s folder, =0D
and follow up with [PATCH v3] shortly.=0D
=0D
=0D
Best regards,=0D
Chipang Kao=
