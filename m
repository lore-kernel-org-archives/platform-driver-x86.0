Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5264C7532;
	Mon,  5 Oct 2026 15:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214766; cv=none; b=i7GOfsSkEcRzuGKB9ydfxKnY9VQAzhWV3SVQFNyBpUNo8qms9pE3IXydjQthTdksHb9N5jLrr5Oi3kAzoB6mk5NphFdtx70vSv6tY8mc8E6AY8Enk2w8RA614y45Zfz3Et/wuvILbf2PX56qWSexAqcVXz0sQmZXlJJaKBljOXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214766; c=relaxed/simple;
	bh=ynEJF2SqYkp8qPh3o+LRVWKW+uVHe+XcgnAZo8fmZCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HL8Vj2SvMKmQ5aQG+0za6xQbqxnc3jJrk5hoxv0jsIi6SlshOJ3GcPno7fGWUm0sqXz/5Z4+P1bS45lyb6bhEd5HJWugVaX6m45BNTxLCbWFN/T7p5tEJaK3BmZJkmozf32n2vAqo4Q4HnT7j+BmDW1gYAvzuJP1DbtKw1+lHcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EiJtPG6+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EiJtPG6+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEEA51F000FF;
	Mon,  5 Oct 2026 15:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214765;
	bh=NKxFrLnZ7VXzXJV8RURK6f8E2Iskw9hoQ3Fi8Vnwd6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EiJtPG6+Oh4Bgxbayj+ef5JuKjMburjIywMdIHF5C4HIw4md1HSadLr0EGyM5hlvj
	 VtZksmBlRTc1SaaWyixbNu2PwbaV8F2DlJVPTsxRWm/tjeO7EMdTcpCnzA7s1sWuVW
	 XuCoaC3UB3AjQKglya0ucqHffoisX7yXXf0yYfUvVaaKfxvv0zv3KHeiItbc3XwJ/q
	 vUGRhZ0jrp+OvYNn66urLRddFwaIcBC0KDoF/Qpffze7I8Z5fDRLnTypehP/+FoflN
	 3hfBG8kgSZP30kDWNny3Pd0plbpDCH/rbN0Q4J/Vmyymja5gQL8xNrYWPnMIb3SoBu
	 faoFWw42K0Rpw==
Date: Mon, 5 Oct 2026 10:39:24 -0500
From: Rob Herring <robh@kernel.org>
To: Alex Robinson <alex@ironrobin.net>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Steev Klimaszewski <threeway@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: embedded-controller: Add Lenovo
 ThinkPad X13s EC
Message-ID: <20261005153924.GA520845-robh@kernel.org>
References: <20261002154231.31376-1-alex@ironrobin.net>
 <20261002154231.31376-2-alex@ironrobin.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002154231.31376-2-alex@ironrobin.net>

On Fri, Oct 02, 2026 at 03:42:56PM +0000, Alex Robinson wrote:
> The ThinkPad X13s EC uses a command transport similar to the T14s EC,
> but has different keyboard-backlight, event and power-management
> interfaces.
> 
> Add a separate binding to describe the X13s EC.
> 
> Assisted-by: LLM
> Signed-off-by: Alex Robinson <alex@ironrobin.net>

Missing Krzysztof's Reviewed-by.
