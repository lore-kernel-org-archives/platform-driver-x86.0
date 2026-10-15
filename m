Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2384D55294B;
	Thu, 15 Oct 2026 15:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078714; cv=none; b=rUlSuL/nB9tUINuOEusZLsbnoHBPtHPAZXnV+MqsRAip6cks/+cfpQaaR7qmw4HifMhYPCUtskGfJ9mC20y4hJ17YGTdhxGDtfs/Qf1BIGZ84O0bjxa+mQH/B8YOhe2y/kPm7bkeqWiVGINQNn7sx4B0VgCUJKuaX1HWezg0Owk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078714; c=relaxed/simple;
	bh=I+kVzXbrVImoxKim9SUcCscwuEW9HqE09aKABsRGFA8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NCHMUJpO9dVk5XAyluwPlUqpfVQlY84hMtrpX9Tu1TE3sMJGLDTsRRyO56lOIVJZS2XkFhpZBcvTmhiblifvj93hD9y/gOBGf7BMeX/urv8g0crcafX3frcdUu6m3mhvewnNIaA9E37GKi6kMR29d1nV49Q80U4OV5fptb2AAjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFVcbDMW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFVcbDMW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0D71F000C4;
	Thu, 15 Oct 2026 15:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792078702;
	bh=gF4R8zEeHiL25NkVdPqa/dIy2QBL8dcXvc8EjTnjx8k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YFVcbDMWhX2AQ8H1wiQedCMu6IYYv5/G3TceVAfOgmbdsxuvVQ9m+wvT/k48xEwoC
	 JePtb1C8/EuVhg0wNoNl4tvFLPL2qJCLl5ejWG/bzP/RlBo88n/rFmcvyN0YkoWrX5
	 3yTuyF9GtLzYCk9wVOhKatlvElSUHxOfVyddyvTNeyJlQqD55l/nw8gwvsws2u/w8+
	 N0txPfEAqAUXh/iFJqY1Nvx/UnlQ7DhnMOUpyv0EoyR9soHivBRAMAZtxZMQuVN/cK
	 Gkm/iuI489uFwQuinD8h5Qv7ECWLFe/9WhSY/81cUL+wSL9vCp0z7ys6kIRRBF3sE2
	 o6eABIzdJkshQ==
From: Lee Jones <lee@kernel.org>
To: linux-kernel@vger.kernel.org, Thierry Chatard <tchatard@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org, 
 lee@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
 djrscally@gmail.com, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
 jacopo.mondi@ideasonboard.com, nicholas@rothemail.net, 
 andriy.shevchenko@intel.com, v.vitovt@gmail.com, dmanresa@gmail.com
In-Reply-To: <20261002163350.1248431-1-tchatard@gmail.com>
References: <20261002163350.1248431-1-tchatard@gmail.com>
Subject: Re: (subset) [PATCH v12 0/9] Enable cameras on Dell Latitude 5285
 2-in-1
Message-Id: <179207869949.2065793.15429443832906134780.b4-ty@b4>
Date: Thu, 15 Oct 2026 16:38:19 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Fri, 02 Oct 2026 09:33:41 -0700, Thierry Chatard wrote:
> This series enables the front (OV5670/INT3479) and rear (OV8858/INT3477)
> cameras on the Dell Latitude 5285 2-in-1 under Linux.
> 
> Per Documentation/process/coding-assistants.rst, every patch carries an
> Assisted-by tag; this work was developed with help from an AI coding
> assistant. I have reviewed and tested it on the hardware and take
> responsibility for the result.
> 
> [...]

Applied, thanks!

[1/9] mfd: intel-lpss: add resource conflict quirk for Dell Latitude 5285
      commit: 194da454d5e204e8bb995359e995fac232fb6da5
[2/9] mfd: intel-lpss: add Dell Latitude 7275 to the resource conflict quirk
      commit: 495d5f41a6161dffafe61ac458459c62d440344a

--
Lee Jones [李琼斯]

