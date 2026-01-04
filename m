Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B812D7DF6;
	Sun,  4 Jan 2026 05:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767504764; cv=none; b=UOM7/TlDZAnHLTch+qwHAaYsPNkd8BmAOVgxH9clQr6s+E4TT3kfieV0mhj1/ynr11BfG2Xo1+YEetj9Km3KIsML0f9nP/nF70Izc/g49hkhH9zZQgJODiHwZNwZq866ohkvYRfoTkUOI432R8GF+Bb5cxnpZJBlsn15CTxhHGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767504764; c=relaxed/simple;
	bh=IwKBWBijKxQpE51gl/8c+oKJlYacAKXSraorYUJOsqE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TdLSPxMOEeuhxO1tR4UvUNRbnn1UOZ5NNgqztcETbKDHUXQCyV3+QJKkqayhI+Q/03leCWV59+EeVEh3Sw/bQg0h0GdKT7xg/Fvg1VNyjxcBIJtbJTC53l8QNlVq8B+i4vbt0sAHmlCLAJPcSBGdRNQIvxRBerdEsxxhnhB37WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=JZJmufjL; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="JZJmufjL"
Received: from LAPTOP-N070L597.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2f67867f9;
	Sun, 4 Jan 2026 13:27:23 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: markus.elfring@web.de
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	jianhao.xu@seu.edu.cn,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	zilin@seu.edu.cn
Subject: Re: [PATCH v2] platform/x86/amd: Fix memory leak in wbrf_record()
Date: Sun,  4 Jan 2026 05:27:23 +0000
Message-Id: <20260104052723.91687-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <9d8affc8-a88c-477b-9ee3-c0ec52e00b0e@web.de>
References: <9d8affc8-a88c-477b-9ee3-c0ec52e00b0e@web.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b877977f403a1kunm2dd7099d2d5fd6
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTU8YVkkeHh1CHkpJS0NPSFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0pVSktLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=JZJmufjLIqcLDwnE9YtzRD4lDGAOorCS11VCSocAhKfve2dTtK0w+BwpNCLgc9dQf7o9aLv1rXZSPyqfCVrotmv6XXkWSCHFYzIMK/ooi9/WfUP2IAIQ7333D8yLKaRLd279A+WukUsTfjos4Ih37/SkOZ87N/f5NsqyFewD6F8=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=Q7IXKyxLwwIdfv1jEeYwFoDHHxTd53TzFzYJzIuOhrc=;
	h=date:mime-version:subject:message-id:from;

On Sat, Jan 03, 2026 at 02:16:12PM +0100, Markus Elfring wrote:
> …> +++ b/drivers/platform/x86/amd/wbrf.c
> > @@ -39,11 +39,11 @@ static const guid_t wifi_acpi_dsm_guid =
> >   */
> >  static BLOCKING_NOTIFIER_HEAD(wbrf_chain_head);
> >  
> > +DEFINE_FREE(acpi_object, union acpi_object *, if (_T) ACPI_FREE(_T))
> > +
> >  static int wbrf_record(struct acpi_device *adev, uint8_t action, struct wbrf_ranges_in_out *in)
> >  {
> …
> 
> Is there a need to move such a special macro call into an other source (or header) file?
> 
> Regards,
> Markus

Currently, this helper is only utilized in this function. I believe 
keeping it local is appropriate for this bug fix. We can move it to a 
generic header if more use cases arise in the future.

Regards,
Zilin Guan
