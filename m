Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3214343FB
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2026 16:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783614110; cv=none; b=Z37fdRr//LDohlVFJw1bqvurhrOqrEm0Fi9sCVQLyLJ9gTD7MtIj8dpslIEJw4ySVV64tXevduCLbpqXYS6I/Bav3XIjitfo/L5XL3y4ciT0HA1FZuJittVXV7rv7ozo8QNXZ/Q6kO1LTodQUa0XVhgP4nAtNt++7M6r1cEjX+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783614110; c=relaxed/simple;
	bh=xEpvieFok8avLZpEapdPi8M+JpwBCJCGxGYN9XqSOu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gN/TLpd2nQQx1YSGz/XiheIKslrgujk0OVGR7oo/lliLnm1sI3cxtg72ccB4ClpLhSSBU85SKszoP9yjrJSGfFrLcKcVEsr/PD7WsbKJuHoY5/Tgc16Ngf3UI/Np7gVCxsZ5f6gKGcTOQpptHQPTeYHD0mQAvmAdYP2LBsY08lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe; spf=pass smtp.mailfrom=nikableh.moe; dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b=d7U665tH; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=WhUGAjoB; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b="d7U665tH";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="WhUGAjoB"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=d7U665tH1x9DoyWHyhR9FR7fh8g+WahFjUihJneVigrMRjLlceBpr2lP8t2V9rSuofFZMegzd2KxcW5sEN7cB3gd+yIbYCaqgzXBOpaaWAc8myHchF51PkAcYh+c0wSeVeFJ3jfVdPD/54ywolsdgEqXk6B3dBsC0/758G1oBYsNOOPMvTTFG9rcG5CUahRNaM5S2FFpc5ADBirQ+hUw1BTH9wwpxuVuCQY6TTlNF0BzEd5l0PMkGcNLirVn6Q362Ad6YwC/63V2wfDp8TVKIrpnGTs5mrAv4D5VLXIY7CO8M2FMGgsoVEvdKHJh2J8nTMLlfhlrGWFvAPsIbCLMUw==; s=purelymail1; d=nikableh.moe; v=1; bh=xEpvieFok8avLZpEapdPi8M+JpwBCJCGxGYN9XqSOu4=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=WhUGAjoBYzzRCEHNTdcm9rn4rXrNZZOZPRnnsQIlzmLzAtcCbDIV5fSqcHVpO5WTxNrHY8D7vZpd2ds3VgjAH41UJD4GfUcRGGnzhKsRzqerCFSSwuUv3wVAxBFEWcg2LNSFtI8bNh95zr4Ire/pg3R8kOwQ8xUzzCTjDlV1S/qRabIfIvxGbhnPhGtWEsYIStkKB3jQka4Vep+CNIAXPayrLcWJF8hIYJUW47c1sRkQTfnbO/XUHwgagXHVlHyPiylNRSdM7mSMplIcF4HGrMUws+Q1kQzKtjNJ19tR5nGNqMC1yz20RnHmfU8qGCrIslhkuxnEPnvGAK2nnFb6Pw==; s=purelymail1; d=purelymail.com; v=1; bh=xEpvieFok8avLZpEapdPi8M+JpwBCJCGxGYN9XqSOu4=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 209604:18551:null:purelymail
X-Pm-Original-To: platform-driver-x86@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1910638936;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 09 Jul 2026 16:21:33 +0000 (UTC)
From: Nika Krasnova <nika@nikableh.moe>
To: Mingyou Chen <qby140326@gmail.com>
Cc: Nika Krasnova <nika@nikableh.moe>,
	Armin Wolf <W_Armin@gmx.de>,
	Gladyshev Ilya <foxido@foxido.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into the bitland driver
Date: Thu,  9 Jul 2026 18:21:05 +0200
Message-ID: <20260709162114.3192259-1-nika@nikableh.moe>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709122337.17417-3-qby140326@gmail.com>
References: <20260709122337.17417-1-qby140326@gmail.com> <20260709122337.17417-3-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

On Thu, 9 Jul 2026 20:23:35 +0800, Mingyou Chen wrote:
> The bitland-mifs-wmi and legacy redmi-wmi drivers both attempt to bind
> to
> the same WMI GUID (46C93E13-EE9B-4262-8488-563BCA757FEF). This overlap
> causes a device
> registration conflict, preventing one of the drivers from loading
> properly depending on the module initialization order.

Also, the commit message is wrapped mid-sentence. I suggest you reflow
it at 72 columns.

--=20
Nika Krasnova
