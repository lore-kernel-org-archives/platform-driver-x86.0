Received: from mail.espeweb.net (espeweb.net [146.185.173.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1511F4713
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Oct 2024 21:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.185.173.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730324671; cv=none; b=oczw4y4ll94ce3k6W3wDvgGKsawLLYgj7I20GCRxJa6T7lvcgweZb6INYE31aHb6p7idsb3lXdhPTe6cTiEI+j+IQKOc6SgnJEofVYTLfp9JGT1uyD7x+JkZRqj5N8lO9qRuRvNgn+Q8pROZHxXLLNL9pzx8MRJKip29mI/1IxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730324671; c=relaxed/simple;
	bh=GQ+PdFmWAR/CyWmOF2lLnhW00W7S/MbRbIyIfrsE5JM=;
	h=Message-ID:Date:Mime-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oZqfEBSBBTrGsQZbbjF+lQtTFmHYHsulkY+ltu5zsr8j19QTNGHvD1OiA8iM4jqm3/iP+rcZeMF4hFxijN9xRDzagbYVKFd413Evk2XdXXCbZI2hzNdOaArLLODB6Nx9TmL19wMPCx/I6hO6r6y+k/x64NxYqZH9RhPKyFj+txs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=espeweb.net; spf=pass smtp.mailfrom=espeweb.net; dkim=pass (1024-bit key) header.d=espeweb.net header.i=@espeweb.net header.b=fUNAS+oX; arc=none smtp.client-ip=146.185.173.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=espeweb.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=espeweb.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=espeweb.net header.i=@espeweb.net header.b="fUNAS+oX"
Received: from [192.168.1.143] (unknown [207.188.169.202])
	by mail.espeweb.net (Postfix) with ESMTPSA id D23061009C8;
	Wed, 30 Oct 2024 22:44:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=espeweb.net;
	s=myselector; t=1730324667;
	bh=GQ+PdFmWAR/CyWmOF2lLnhW00W7S/MbRbIyIfrsE5JM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fUNAS+oXCVVa4iSTiWH6HJx5ZC+5wj11tMdZ7rq+Mn0BK3p9jMApdtmK/ryJQ0EEP
	 w3eqv8cv/T9Km+bjA9jVvO6Nk15MrX1pKHULcgg73znlZn7pqSuv1s/4dlPRlnyG0t
	 +vdIKCHESBJw2XdeU82/unyLav1iYMhlCnCw2eg4=
Message-ID: <7557c282-2521-40d5-a499-48b260c7db4c@espeweb.net>
Date: Wed, 30 Oct 2024 22:44:22 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: Re: "asus_wmi: Unknown key code 0xcf" when plugging in charger to
 laptop
To: Armin Wolf <W_Armin@gmx.de>, Corentin Chary <corentin.chary@gmail.com>,
 "Luke D. Jones" <luke@ljones.dev>
Cc: platform-driver-x86@vger.kernel.org
References: <54d4860b-ec9c-4992-acf6-db3f90388293@espeweb.net>
 <6131c8e6-5a25-492f-a296-2ed56a9db360@gmx.de>
Content-Language: en-US
From: Pau Espin Pedrol <pespin@espeweb.net>
In-Reply-To: <6131c8e6-5a25-492f-a296-2ed56a9db360@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/30/24 1:06 AM, Armin Wolf wrote:
>
> can you share the output of "acpidump"?


Find it here: 
https://pespin.espeweb.net/~pespin/tmp/asus_wmi/acpidump.txt.bz2


regards,

Pau

