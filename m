Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF9330F534;
	Fri, 12 Jun 2026 22:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302982; cv=none; b=M5rFwjx9iTVb/fmVXTBKrST/5i2ZVZDjyKZAgumIi2lZtLOK3vBbfBRciG5+9sDRmLkCJX7C5K6jQDr9ONwOiTq2seh8ccG/TA7H2Vgi4Ke3vkfC+MR/p+4uGiRazcWLn1KTscLvtsEFa7F94lpr7GMZSm2bHdim26hnPm1+Bns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302982; c=relaxed/simple;
	bh=NDkKmSPmr91krCNjKPopZNxi0eVtxOKKYhBbQ1qk6y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyHyH5epazGNSV2rTpnMXdM/yWXxmwth5IbIAyXKN5HuLC85eo4Wa7Kiu0LdWTydTRc7y9Eh0Kje9XT21m8JRhu46/OP4Ekjt8GeeI6stClVDZN8za8t/o8cFyD1vye4qyTCwqR+oea/fqoc1PTs6xthtAp8Yyfk75f6tB6kAQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+XcxFLu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+XcxFLu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFBC71F00ACF;
	Fri, 12 Jun 2026 22:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302980;
	bh=qVzSfaQLk0evyCs4Asu2hRrwJkoSAxGRjiHZu1Hl3xs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U+XcxFLuBqz2wekWL8/k7ASYcCHeUU7ND8B7KkFTBOzBUdBhz1qrib3WzWIga3t6h
	 JvqkzgywfGUUYw9CBI1HqTQntPsE/0hII/PTih4wKQGn/2+RTy2iwoPDw+YbJWSIrF
	 caVWjByqtKvlaZyXZwcbNtjMkpC7rf4iqh72Wx2y0iKbwGTof9TmK6HeEvpdkCKruo
	 hsxBN1zCQkb1Q8nbrrshxLaPy9jGgYH9vvAPISFFEmCZUasdiN78SSHBAjIj36AQYz
	 XT8LHVcYgXA2BBej/3MbQSsj20vxu0IX8yP+fJCSQHX8UxixtZy3LsnLBh3tIUm6tx
	 7UqiGMjPhZvag==
Date: Fri, 12 Jun 2026 17:22:59 -0500
From: Rob Herring <robh@kernel.org>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v9 1/6] dt-bindings: embedded-controller: Add Qualcomm
 reference device EC description
Message-ID: <20260612222259.GA1960900-robh@kernel.org>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
 <20260511-add-driver-for-ec-v9-1-e5437c39b7f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-add-driver-for-ec-v9-1-e5437c39b7f8@oss.qualcomm.com>

On Mon, May 11, 2026 at 06:13:19PM +0530, Anvesh Jain P wrote:
> From: Maya Matuszczyk <maccraft123mc@gmail.com>
> 
> Add description for the EC firmware running on Hamoa/Purwa and Glymur
> reference devices.
> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  .../embedded-controller/qcom,hamoa-crd-ec.yaml     | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)

Looks like this was missed, so I applied it. Please make sure your 
patches are applied. This should have been applied with the driver or 
.dts files.

Rob
