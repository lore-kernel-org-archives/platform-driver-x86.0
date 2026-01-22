Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53FD3DA2C9;
	Thu, 22 Jan 2026 23:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769125527; cv=none; b=U7aBNUaCUeJn+EZ7XrRP6hm7pki+uX+8jL0WbWpBORxDgClZxtWrVyvKfVVyNHtQ8GwAfVHpALLzXepGn5mIenMc2gRQ0MH9Uj1/f7kSBzvO+HexHnuwxoo7Q/Fn0DVA7vG3PEh4i3w9gH3jZVJRz8BofVqG1qM2QdtvGhaZUWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769125527; c=relaxed/simple;
	bh=cKuHsWZ/XbupG8cRTrFGfUP2qLGonwnb92BpvKeZNPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKnrpsX5mmszNM7XQQvcO5jdqIE+wHryJWjepmo1TQxCnvZ2a09JY8Z2Ki/QH1CuwaPoWM25tuWnzhmH6ADjbYZxIePf3e1VcEk+zp1M+UoRIUdnQ2TG3UMI+fk3D9kianWNU5nnL5NEmROqhLjRCQITgeGnbxhHQedkMAP2c6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jU0p9GVO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jU0p9GVO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90838C116C6;
	Thu, 22 Jan 2026 23:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769125525;
	bh=cKuHsWZ/XbupG8cRTrFGfUP2qLGonwnb92BpvKeZNPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jU0p9GVOkRK500u75iF0VWnNCHrv+MZRsz69aOuVSqpZ7LUg2j3chHUF5GgFAytKF
	 Md11MSWGSusfGeG05Vu7Rj7XBDEpnbbJQREBRT2hdFokfkUYramaw64cymYvzu9nKE
	 FfGy6kePonzvsusDlPlPq7MqJPBdJW9Lx1TAcjy3x3/zNAhbs3E3wQgw8eykQ1xCnb
	 ngJu6NUKbWDUW91T8oDOCDtIZPwSnpYHF3NlUeegsgPO2n7TkE475bNq73yEQmdT/s
	 /CGAjdOfYQ8q75Uh9rqcNt1Q14xWxJb27+vv5YSHINLWXszd7fnMw5Ye6y2OhZcHJI
	 rv4GjMjwPvOlw==
Date: Thu, 22 Jan 2026 16:45:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@weissschuh.net, Dell.Client.Kernel@dell.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 4/9] platform/wmi: Add kunit test for the string
 conversion code
Message-ID: <20260122234521.GA413183@ax162>
References: <20260109214619.7289-1-W_Armin@gmx.de>
 <20260109214619.7289-5-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109214619.7289-5-W_Armin@gmx.de>

Hi Armin,

On Fri, Jan 09, 2026 at 10:46:14PM +0100, Armin Wolf wrote:
> The string conversion frunctions provided by the WMI driver core
> have no dependencies on the remaining WMI API, making them suitable
> for unit tests.
> 
> Implement such a unit test using kunit. Those unit tests verify that
> converting between WMI strings and UTF8 strings works as expected.
> They also verify that edge cases are handled correctly.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
...
> +++ b/drivers/platform/wmi/tests/string_kunit.c
...
> +static const u8 oversized_test_utf8_string[] = "TEST!";
...
> +static void wmi_string_to_utf8s_oversized_test(struct kunit *test)
> +{
> +	u8 result[sizeof(oversized_test_utf8_string)];
> +	ssize_t ret;
> +
> +	ret = wmi_string_to_utf8s(&oversized_test_wmi_string, result, sizeof(result));
> +
> +	KUNIT_EXPECT_EQ(test, ret, sizeof(test_utf8_string) - 1);
> +	KUNIT_EXPECT_MEMEQ(test, result, test_utf8_string, sizeof(test_utf8_string));
> +}

After this change in -next as commit 0e1a8143e797 ("platform/wmi: Add
kunit test for the string conversion code"), I am seeing a warning from
clang around oversized_test_utf8_string:

  drivers/platform/wmi/tests/string_kunit.c:108:17: error: variable 'oversized_test_utf8_string' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
    108 | static const u8 oversized_test_utf8_string[] = "TEST!";
        |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~

oversized_test_utf8_string is only used in sizeof() in
wmi_string_to_utf8s_oversized_test(). clang warns because sizeof() is
evaluated at compile time, so oversized_test_utf8_string won't end up in
the final binary. This is typically a bug since the developer may have
intended to use the variable elsewhere but I was not able to easily
determine that in this case.

If it is intentional that this variable is only needed in sizeof(), it
could either be marked with __maybe_unused or eliminated in favor of a
direct 'sizeof("TEST!")', depending on maintainer/developer preference.
I am happy to send a patch.

Cheers,
Nathan
