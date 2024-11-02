Received: from mail.espeweb.net (espeweb.net [146.185.173.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57AE4EB50
	for <platform-driver-x86@vger.kernel.org>; Sat,  2 Nov 2024 20:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.185.173.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730579769; cv=none; b=knl3YqtxI1v+U/XZzHX+Ld1DrMBkgq4v+zGYt+ua5W5vxgLm1zPZpLv2ixgYJkExzMKiQbcs0ipZzvTbqPJW92ZdXse7SkSrWvmbJ7XK+c9NaE7yZ6BHBcdiSJAQTSQdzfhxsixVqX4jrz18yZozePjayNWHRiaGecGwkFpiyCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730579769; c=relaxed/simple;
	bh=+9onBDvKOng17JkJajthW4SDs84PcJXz6Cy69tHYoqg=;
	h=Message-ID:Date:Mime-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mqjVAQ8WWA1rBg8z30VRHbbog1hOX4sNAVys3TPUVt8NavlKKebIG5k0xDqNYnX2nPzgS3aACK/udfJHv/UUT6SGT0dfC2vLr7cYyfrLQmmR65RwIcS2dB/Zw43UR43uoioRI+Rv0/f2jQFaEfBBV6EW1EWfQ26CFqXtF6DE1iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=espeweb.net; spf=pass smtp.mailfrom=espeweb.net; dkim=pass (1024-bit key) header.d=espeweb.net header.i=@espeweb.net header.b=kvARcC0L; arc=none smtp.client-ip=146.185.173.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=espeweb.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=espeweb.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=espeweb.net header.i=@espeweb.net header.b="kvARcC0L"
Received: from [192.168.1.143] (unknown [207.188.169.202])
	by mail.espeweb.net (Postfix) with ESMTPSA id 27A011009CE;
	Sat, 02 Nov 2024 21:36:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=espeweb.net;
	s=myselector; t=1730579765;
	bh=+9onBDvKOng17JkJajthW4SDs84PcJXz6Cy69tHYoqg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kvARcC0LnTMF9bzKq8E6F8MAUFz+qzvTN7pINCfPDgGSWdRMh+sFc/VZC4hPp3ynB
	 DkTcrWPfrZBeLSGaicoQh7Q8G2Oo8WsOFz+McbC63+EUl+O+f5X1bM8A/Ori8EVElt
	 58irAlPzqSrLUqCHx59Vd/5khE3MPIztIBInydtw=
Message-ID: <44038286-1655-437b-a952-e58a43f55f69@espeweb.net>
Date: Sat, 2 Nov 2024 21:36:04 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: Re: "asus_wmi: Unknown key code 0xcf" when plugging in charger to
 laptop
To: Luke Jones <luke@ljones.dev>, Armin Wolf <W_Armin@gmx.de>,
 Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <54d4860b-ec9c-4992-acf6-db3f90388293@espeweb.net>
 <6131c8e6-5a25-492f-a296-2ed56a9db360@gmx.de>
 <7557c282-2521-40d5-a499-48b260c7db4c@espeweb.net>
 <8cbc8310-7533-40e4-ab2b-b8c3c9e1911e@gmx.de>
 <542d3ca9-5b63-431e-b711-39f7ab387204@app.fastmail.com>
Content-Language: en-US
From: Pau Espin Pedrol <pespin@espeweb.net>
In-Reply-To: <542d3ca9-5b63-431e-b711-39f7ab387204@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 10/31/24 11:55 AM, Luke Jones wrote:
> Do we know which laptop exactly? The "gamer" laptops along with I think the ProArt ones use an MCU on USB to do keyboard I/O. Others use I2C.

#dmidecode | grep -A3 "System Information"

Manufacturer:  ASUSTeK COMPUTER INC.

Product Name: X541UAK

Version: 1.0

> Not all that relevant if all we need to do is ignore the event but there might be something additional in code already that can be used.

Probably just ignore. I submitted a similar patch a long time ago for an 
eeepc I used to have:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=999ddbdf3c8354077660efbac9ab91c12187d6d2

I don't know which is the relevant file in the case here, since I see 
there are several asus files with keycodes. Hope it's clearer for you to 
make a patch.


Regards,

Pau

