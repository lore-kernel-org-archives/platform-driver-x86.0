Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67B33A6EE4;
	Sun,  5 Jul 2026 20:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285095; cv=none; b=dv7XqnNuB8HfKRSV9XRUyxszGrKrCnY8u1NfQJHrrkbv5S+LnIloJaz0LO/upWwbCrgoq5BE7MssEbcNKJu8OLx2bl4v4cxsGbvcZ90DcydoacCHWjYZ74BvA+h9C/ietSNpH/PTrs3FyAulJKtM1U8FaHUo3vroXlvcZIucw2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285095; c=relaxed/simple;
	bh=0fAM/vfFb/mzJQUQKWHXt4sUXmwnCYJxeCIcMI+2SsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=McnJ7N4HJccoGEJ22opTgzyTz8rxMYy5fGZ5dQBgjF1zaEfVwCq6B3zrlqUNnpkjpaIu5sUkoIDI16KCkhiE/EkwfB+WGL6KuPmbOyn2z77je3inRG1kWju6UbLQrvZ/X6zE7PTFwgS22tdZJjVIyfxCVDVdBHNRzu1apZOr6Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKUKhFR8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKUKhFR8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49391F000E9;
	Sun,  5 Jul 2026 20:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285093;
	bh=SC97ZipM8A6Y+AybO6WBC3SfHNqSv5l5DE/TBUj4WjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DKUKhFR8NZNB2DAGLlJEYWinaziT07mlqUG9VloMBcbGrOQFLt4sP5i0e7JmS1sAl
	 K+stvpbK0gQnPfXU9j3XlOxTt3Fno2BBZxTVpgfANVsEjTdgOO6rVMJ0PstsNWo9km
	 P55qebbb5w19OIlWm3ztfllq0x8ERAscHrmfL8zAIPxJ0KJJuMsv+wJvum+cmdugof
	 pCAkjsomccRQG5b8gn+L15er8o33MEPTAGWWOKzmYpXwwsq8PyzckbhwrxGO5qoNm8
	 IBWIUdVhX50r7Ne7yOk+2DQ0LtHxGXre4Svj8UrErjFRs0YXjlCC1LkilV0r+yNu+y
	 9Cnum9S3yAfDg==
From: Bjorn Andersson <andersson@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v9 0/6] Add driver for EC found on Qualcomm reference devices
Date: Sun,  5 Jul 2026 15:57:51 -0500
Message-ID: <178328508269.1157743.261938351735210440.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 May 2026 18:13:18 +0530, Anvesh Jain P wrote:
> From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> Add Embedded controller driver support for Hamoa/Purwa/Glymur Qualcomm
> reference boards. It handles fan control, temperature sensors, access
> to EC state changes and supports reporting suspend entry/exit to the EC.
> 

Applied, thanks!

[6/6] arm64: defconfig: Enable Qualcomm reference device EC driver
      commit: 734d1de41915bf84b89862b275b5c2be88d6ef6b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
