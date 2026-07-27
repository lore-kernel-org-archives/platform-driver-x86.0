Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBA83C4547;
	Mon, 27 Jul 2026 20:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184694; cv=none; b=ff062euJmeJPr4EsflfbWCOjisYiwsI/9pcPHSwluAvxuowJ+zKY+J/FpfbKa+pyd+ww8IMKjvukLBKk1lZjfSpH6R+r6DtCd7Nox1Kbn4lu1NFhnsBZp9BUUb/HXaR6IT5/zsIr+LgwlLxy9q3ORtj0+hDlCGb2xhTPBGJyUPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184694; c=relaxed/simple;
	bh=LphZ4gQFKj5pWHE/qoF4Xt3q2cs8Zr8NroDSbfciro4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VU3tm3Dgsp0JZsoMIG2V8lPdpLoYNGvNTszeU8RXgkEwhUwtJY/rkCDB9cyPSV4rvy+zwGDt7jMUmRiCJBbUzpUSAodZCdyTHQOIdAbrwuWp3Zf7fcLDaTY5VqStCOV9kAAO5kwmTroov5zc7ZBQxv/2GSG4GXqK7NQ0fQiSrUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L5hrLzqk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L5hrLzqk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84CB21F000E9;
	Mon, 27 Jul 2026 20:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785184692;
	bh=Yvjdu6w9W5jk41VdS+aD9B7ZMG6fPgnGCjj8DXPL0N0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L5hrLzqk7OgXAopqk3zQjj7sIUF6rRGZIYt66DTNccfc69KiaJvdck4NVZsoaGgdN
	 gkT80C7KCnCvKX5oQ+Uavmv7wMFk6w1voXzZZsswlLUCjuLUBSCQApIMSUnGaz/CFh
	 3wQ3uhntVXi5iW5J6v9IksAP2DYNjKaOTzLSB+UNGg/STG5+T8IyBm5tJDGl7be8ty
	 UDISJcHlT3yf/VhcESVAxTZ7HOjnYl3NlHu97n8k1XXy+K8JNe98hAk46pvnOT9xAs
	 dIrIJHK6nVK9rLbCrjMPD/84DNBEy1e6h28iWNhsaZXSeXt2rtgjAfa+MCt1P8IFrb
	 4y3girB76pSmA==
From: Danilo Krummrich <dakr@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	brgl@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/surface: gpe: add missing err.h include
Date: Mon, 27 Jul 2026 22:38:06 +0200
Message-ID: <20260727203806.2274548-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727144308.61842-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260727144308.61842-1-bartosz.golaszewski@oss.qualcomm.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 27 Jul 2026 16:43:08 +0200, Bartosz Golaszewski wrote:
> [PATCH] platform/surface: gpe: add missing err.h include

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] platform/surface: gpe: add missing err.h include
      commit: b47dcd7b41e2

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
