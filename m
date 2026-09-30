Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B95946A60C;
	Wed, 30 Sep 2026 20:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798475; cv=none; b=LDqTFgGLCfEqVnKliYbU3c130aCDsDl41fOdBRAIUkcsXSPpwbVQBAJAWjQrHF7PeFFybGz8rqIjd7gxy6Fm0LBgYGA5uLI/UO8isDJaAkGCVIQ4yFX8tiAKf+DYDGzCeqzfjarrt5O2a2LIZYHaexklO+EdDQf0tW3VMFdH2Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798475; c=relaxed/simple;
	bh=+I7flEh6k8Z0rb4k4nXDXFcvKrJwe0lbxShGCKzVoxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NJ7UzPDqyOlRg91KmW/lsI0vzsq7a62FkcEgHWhGYVFzx7f9KbBo4wXtTqviPTTJzY9d2eNHRtw3wKzTXH8H6UmZEepCm6lD1z4mP3Zm8eFbqCpmJR1ODhriv9kClfVHCXgcpR0YBtqDBCpuTQvhiP3Yp4lvgBHE/0GXCoA56Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=UhmO0W3H; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="UhmO0W3H"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9792F82BDC;
	Wed, 30 Sep 2026 22:01:11 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zQc2W65zPgOp; Wed, 30 Sep 2026 22:01:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1790798469; bh=+I7flEh6k8Z0rb4k4nXDXFcvKrJwe0lbxShGCKzVoxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UhmO0W3HLzLGCYtkugLUL8fLXsf0bdmRQYz+d3ufbShyUV7YMYUyNJRf+P/GnZEIN
	 21PAwI1givqxoxnWzhz53ZgmQaJe0xejt5YVb95VVJ4A4ypMNphQtz5wq4SHbOe12L
	 2Ix5anRfjvvZI4e/bp8jpV8A6ZfP9YYxbGgmVz1UxS1huJEHmHzxaAn4nUZuhgn27U
	 Ut5Q5+v6NRVGhMqzsS4TbEzg/xr2O2W8JZozX4dAGVpFuBD9FSVc0CIe0l8cElCWIt
	 srpoXWvEV+te2SqoB5J+WcjHZwiJoNJGfVFFlNFCDlffw4Ce+kKHACf3KSht5hyGjK
	 2u2v1IbOf+wWA==
From: =?UTF-8?q?Ali=20Ahmet=20Memi=C5=9F?= <aliamemis@disroot.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Hans de Goede <hansg@kernel.org>,
	Nitin Joshi <nitjoshi@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Use input_device_enabled()
Date: Wed, 30 Sep 2026 23:00:57 +0300
Message-ID: <20260930200057.278659-1-aliamemis@disroot.org>
In-Reply-To: <ar1iwx_390hWw_e7@google.com>
References: <anK1j7hbMyFHGBUS@google.com> <178947195441.31094.9793704324340226838.b4-ty@b4> <20260930075829.53484-1-aliamemis@disroot.org> <ar1iwx_390hWw_e7@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Sep 30, 2026 at 12:37:54PM -0700, Dmitry Torokhov wrote:
> Hmm, indeed. I wonder if below will fox this for you.

Yes, it loads fine now. I also toggled inhibited on the input device
with polling enabled, and the nvram thread stops and starts again as
expected.

Tested-by: Ali Ahmet Memiş <aliamemis@disroot.org>
