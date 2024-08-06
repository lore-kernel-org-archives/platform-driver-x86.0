Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1953F9EC
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Aug 2024 16:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722962645; cv=none; b=SecJRyBWNTWv0pvwRa0ttYYbAimrIwCmrYDHw81mJDtseLgDhaMOHObuwBWqaPyU/vUtewTOUn2TcoJHFLkXY+ASgMzOB/gV268u7RM7H9Z+pwU4psgd5mXH3nuxMdXRqX4D/HBi4WjGEIJfWnoSsM2kf8DCRRZcGjwdwujI4To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722962645; c=relaxed/simple;
	bh=vz5kq7FWfT8U2jM+rFomQsFlGPg84z3oPRfz/3LL3NU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BcJhGG3AjyeQqw2EYAedS04g97pkj0aruD5eDcTjP2k+Ff5Qp6ZdYsCowW/Rvs9jbZcelXJPsAyaFVF/WGjw9TTt5DrE3wJw9KgpbC43k3dp6/4WerNMmTIXOHn3zP+sQV18YIA8ovl2ePt5wdVZRWlBzbBqDAyNKJgcuBWgILU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=lYITqySU; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="lYITqySU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=vz5kq7FWfT8U2jM+rFomQsFlGPg84z3oPRfz/3LL3NU=;
	t=1722962642; x=1723394642; b=lYITqySUGC3gWvzCTqFezB03nkq/Ff8BZ91L+kChyI2u6IF
	i6aHszEblTIQnUaPzxpI0GvWL0AMRhj3TfVoqL+2BMfxArfoW6/eua7GiVQu+33ZdfFOYl56wlCUQ
	40O2txa+xjSBz3LDsOvAPNJJNrEAhJ1+78btTEVUYrZ446wAt4HmW+iB2SU4+xwzqTdxNvVja4Tkh
	+HLVZXvlPHQ+sGvkgS26jntqziWWtJRanM7Ga8Z+Rp+Z4si61AJhcH0Q00CctTYX3JAzikHk5WahU
	PCMTsl2NevxD6pQC8hug6pYU8IFHgWIPiTfkfadBz+6PmgJU3d61uMy2maSgXBTw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sbNHv-0006cj-AG; Tue, 06 Aug 2024 18:43:55 +0200
Message-ID: <84632b31-6e97-4493-a97e-572d288b294d@leemhuis.info>
Date: Tue, 6 Aug 2024 18:43:54 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: hp-wmi: Add thermal profile support for
 8BAD boards
To: Alexis Belmonte <alexbelm48@gmail.com>, hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org
References: <ZZFGgfsfrU2vuQoI@alexis-pc>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZZFGgfsfrU2vuQoI@alexis-pc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1722962642;d8b72c3c;
X-HE-SMSGID: 1sbNHv-0006cj-AG

On 31.12.23 11:46, Alexis Belmonte wrote:
> Add 8BAD to the list of boards which have thermal profile selection
> available. This allows the CPU to draw more power than the default TDP
> barrier defined by the 'balanced' thermal profile (around 50W), hence
> allowing it to perform better without being throttled by the embedded
> controller (around 130W).
>

TWIMC, someone is asking to add the 8C77 to the list, too:
https://bugzilla.kernel.org/show_bug.cgi?id=219125

This is not a regression, but I saw the report and thought I share my
find with people working in this area.

Ciao, Thorsten
