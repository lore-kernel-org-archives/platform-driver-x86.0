Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD73913A86C;
	Sun, 22 Dec 2024 23:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734908755; cv=none; b=uE+cBqJALYRD/JhnmWwrqQXVeFQPF8Daf/+s24hzbUZC9Ydsaf+8J/S9WyyihIZoYIoQBSqRAkfY4N2TD2FeOBkjmDebWGdDhWDJIs+z9OzqoIRsdn9kOanE8H/1ieAAEn/YmrL02ud5NGrXhn+fi3Es+dLpiX6poa4vrsCJN90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734908755; c=relaxed/simple;
	bh=4yJK/F5MB9oLXCdw8ij/SKPHc7imyfiQqX9pjCHcggQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iDIt63iX5fBTOed7kAyahz7ldfuqBw2syaCNM8Sn7b5jlLeQKHgBsHrjnoSw/9doo/RfRowjI2uPD5ruUuxRBvhp3brtZw1z5r2GqrYsASylqqcNRh/XiCEArC9wWVoSYBjl280DUUq4YqeYp/9fQ20iYYCdF9rPWNczXm16ZHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=GRuOwbWK; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="GRuOwbWK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734908726; x=1735513526; i=w_armin@gmx.de;
	bh=cJMZvvbaZn1wNxIjJEKbloj5qjxozL9BMJTpm6gavNo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=GRuOwbWK5WYGO/mO4VP71Ditr1QkXIkYm9QDN4hLyE+/DvIli7ORP0rcPb0ldwwH
	 Vg+DFeEjvJJRooulR1xBHw7b+PxWfDHenH/h6tbXuhF+hFtNWEdiDrYL2TEWLFvJT
	 qe2HwjrdgNe21nV2jTQD5NIcbRqqbDMzNSzFVSO04NqBlFjJ10MUEISU17VEu0cZc
	 aF7btdAu6psyit7gCftRRt+otFhLAqD9bC1oXyWuakAbhefUU1mZQd8yG3EKwx7Z3
	 XTmO1jKdDSkaUSRq27TMSEg99GCMAir3KUvpeE1cO/vo9rvcqphwpUWHf78QbRirX
	 NxDhvyRYTyv3AzJZfA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5VHG-1tazF93pDW-018L6W; Mon, 23
 Dec 2024 00:05:26 +0100
Message-ID: <a1c25bd8-907f-4b2a-a505-15785eb4b17b@gmx.de>
Date: Mon, 23 Dec 2024 00:05:24 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] platform/x86: Add Lenovo Legion WMI Drivers
To: John Martens <johnfanv2@gmail.com>, derekjohn.clark@gmail.com
Cc: corbet@lwn.net, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, luke@ljones.dev,
 mpearson-lenovo@squebb.ca, nijs1@lenovo.com, pgriffais@valvesoftware.com,
 platform-driver-x86@vger.kernel.org, shaohz1@lenovo.com, superm1@kernel.org,
 zhangzx36@lenovo.com
References: <20241217230645.15027-1-derekjohn.clark@gmail.com>
 <20241222084216.1420666-1-johnfanv2@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241222084216.1420666-1-johnfanv2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:xKFf9feDDyQsBjjbl3o2tMOZ+PGl1FfI9ZV6Z4ekSYIlFTCiJQl
 BHKNDNIjMEJKWVGtTts0Wb9WuMAQ9DX43GtEVi+Emcmc8sQX/XzAgb2lXlYfbOTEW4ZFa43
 2B2pnG1ZdvtjZ0/O/oTOkqwKSc5VcV02wxdePWGfh0eIJdu5YS8CD0QRsgBbyZ8BgQ29g78
 TdN/pxkv9iuz/nXVO+peg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:r8D5vIyliKc=;HPsbqxCadyk5H7mmKvk80B8xp0G
 +xlxQajg8F+f7VdI4/Hl95TFwWgKci8aCJRGvXsQL9AebSd1gGv3cluXUD28+zkCYe8Ppo8M7
 pWqf6iXYERuFfURGz14QWVrbns6416fm8yvml+myW1AcljAiiwi56g8sNfmmRd1jKCSuv5S6m
 7pYkgQZg/fZOHVK847JM98uoZ+imBXWnBSFQUTcJnTeC1v+y+ZMWwipvUHTfCToI+WOtm/hOv
 g7R5ALZoCzTY7iSgA+uAkeEJP+V/HB3yVu4QJ0g5x3N/uV/r91q63vhkgRdmummRuKxKP5lak
 RcfGUZvx+j5/Y2SLtvyQFFZDfaR3fPy5HtBHoPh9P0QflT8kpB5QrGlqCuW+ITNw7G/46DLV1
 a1T0EGc/fAlCdpVcLn858BzmcVX39ByvsLNou20tmWA4fw6qwqyT4I8rR2nftuy7PH84dekXT
 XPh+GfE3fmBQjiCnEs3SwvZuy3cKHkv7q1yHbFeaixHJccb0YGB0g5+plWQeC9HP57UWOvfni
 3GhN6R3A0JDVS1dQ1DCCyJ/Nl2bFl97lrBEFi7aIfJdyLtJS6Bmqt3VHNlddeOYQX+5cVckSn
 ypYpqzV3GmkrlkJfdLDeOurLkP9jwOMPoq1UrU8fc0rtVz2urMwkGQJfXJTyWEOW3ZpVbs0OY
 mnqT3ta0M8eOejNmGscf+WbGeZ6me+5teXfnBDJsqO/g7xEPaumruXUcu6S9XNEX9CouJna74
 +pXIyitoRMED0RS/84xvOTOYiGXyDcMHTtHUs0voL7Ush81bKcWyGetiXcK0uU9gGyTtGEjHb
 gsO5Vgd1ahiPYOX2YlhcED3G1LRs6/npjimFO5bssP85nf8rqDfyBiQxiHQv68F4zJn13gG9W
 BVBxNB7/3WQVo7+FMmVOzdRCO7soVwaN2Dfm9GqPosXfTQf5SPVRwSOuzAjHK62GZRwu3nQNi
 QLSWzih8M4YwAe7hfZyECppRrI9FZobY44XGzFDdAz9Po60cnrOz+c4wbhUSnITm3QaPp1Ukf
 U9MkAPN1oucO2MOjSuemxf+WW69P8hZejFcu4JRfjYTCZSkXZdVqZpmBpha95BS3vl2Jyih7Q
 KG7/C7WR41QC9mVmjf+ye/VlJnDhJ4aQ5Tg9hLZiaOHXIyCehZX9eajNvn1DLi/5V1TZRs3PA
 =

Am 22.12.24 um 09:42 schrieb John Martens:

>> Adds support for the Lenovo Legion series of laptop hardware to use WMI
>> interfaces that control various power settings.
> Note that there already is a driver for Lenovo Legion laptops that I
> wanted to merge upstream.
>
> https://github.com/johnfanv2/LenovoLegionLinux
>
> Compared to the proposed patch, it has the following
> advantages:
> 1. already popular and tested by thousands of users
>      - many stars and discussions on github
>      - patched into multiple kernels of gaming-related distros
>      - packaged as dkms module for almost all relevant Linux
>        distributions including Debian by other developers
> 2. supports many different Lenovo Legion models starting from 2020/2021
> 3. supports a lot of more functions, including fan control, which is the
>    most requested feature
> 4. supports the many changes between different in the WMI/ACPI method
> 5. actually shares some credtis with persons who revere engineered it :)
> 6. support by GUI tool to configure it all
>
> On the other hand, my driver has the following disadvantages:
> 1. The version of master on github is the most recent one and contains
>     a lot of debug output that has to be removed (often indicated by TODO)
> 2. It is all in one large c file instead of organizing it neatly into
>     multiple files.
> 3. It was modeled after the ideapad driver instead of the newer ASUS
>     driver.
>
> A few notes regarding the many changes of the WMI methods that I tried
> to deal with in my driver: note that in almost every new model a new
> WMI method is used to control the same functionality (e.g. fan control
>   or powermode). Additionally, often the constants or the unit changes
> : e.g. percent or rpm for fan speed.
>
>> The driver has been tested by me on the Lenovo Legion Go.
> The driver on github has been tested by thousands of users.
>
> I suggest that we maybe combine the two drivers before merging them,
> since Derek seems to have more kernel patching knowledge and I seem
> to have more worked on all the Legion laptops.
>
I agree in combining both drivers.

I suggest that we first upstream the bare-minimum for supporting the gamezone GUID
(no fancy features, just the basics) so that:

1. More features can be added later.

2. People can work on the other-guid drivers.

Sadly your WMI driver needs some work too since it uses the deprecated GUID-based WMI interface.
Because of this i suggest that we first upstream Dereks driver for the gamezone GUID, which can
then be extended by you step-by-step.

Thanks,
Armin Wolf

