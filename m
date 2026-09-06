Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0D11FD4;
	Sun,  6 Sep 2026 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788700328; cv=none; b=GgtgoK01iff7/YHZa7ieAk0m3TO91Cmm0+VzDAuoPxqwjuwMwkWCmITwcUwAxp0xqd340UthPdtqjDY8uAQprxZe2iueVx5K08pBCy57lV9K6Eebv9GTkF0nHy+ccI+etF5/Y4oV9QuA3x8PtS+Lga5XmLdupk4mt7+O/P88Cfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788700328; c=relaxed/simple;
	bh=vnc2z4lkIZo7yiwleLIVB0SMK4JRk85lJPWFGeVTU9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nyljq8jzqo8dZExgL+rTmg5BP1JaEy7JRbsW56kE0OBSqD/buixMdxCgsOgzJGYFRBCK77pWuaty2alwrUlMpICrMk/HZvv0R9EpfAIg+sC2ZxOTkh5l098GTgkPvBti11IW0CmVWRhMJ1jK1RmJowC9XVKlsd9GNfXxPooX7vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=TTG0TP79; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="TTG0TP79"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0F1FB80F66;
	Sun, 06 Sep 2026 15:12:05 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NBP6OALUV3pE; Sun,  6 Sep 2026 15:12:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1788700324; bh=vnc2z4lkIZo7yiwleLIVB0SMK4JRk85lJPWFGeVTU9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TTG0TP79iAfrAR/jTTrE609gHyyfDEKdfTH9xL2aWi9isH2CgBySHbmKHjIET6y/U
	 sOclC8vcKSA/xyHQJEiMZlHmsdC2KQVLe3vRmHQEzSUxb41hSKNMzIjXuTULMeO/B4
	 IwRmBz8XYDONVSIG42QYzd9HDA0kNxO9nmG6H/pOZkf0wiXiAFSP/cI5hAALeBfwHt
	 l2kPkqlZ6WfLKI0bD348knAsWcLqCLpN9N4i9UFoXQB0gu6qLhHKtwgDCkvGk0jPwQ
	 dUp1onOLU+sn+yI3kgnIvXHuq2deQlLszuYexPX/djYPiqX/fm/Qw3MetfsCYjNZIV
	 EiwYAj0Ura+Gg==
From: =?UTF-8?q?Ali=20Ahmet=20Memi=C5=9F?= <aliamemis@disroot.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Nitin Joshi <nitjoshi@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] platform/x86: thinkpad_acpi: use __free(kfree) for automatic cleanup
Date: Sun,  6 Sep 2026 16:10:21 +0300
Message-ID: <20260906131107.20966-3-aliamemis@disroot.org>
In-Reply-To: <20260806061925.625482-3-dmitry.torokhov@gmail.com>
References: <20260806061925.625482-1-dmitry.torokhov@gmail.com> <20260806061925.625482-3-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested on a ThinkPad T490 with lockdep enabled, details in my reply to 1/3.

Tested-by: Ali Ahmet Memiş <aliamemis@disroot.org>
