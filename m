Received: from mail.d-sys.org (70-31-180-213.sta.estpak.ee [213.180.31.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232543EA83
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Feb 2025 14:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.180.31.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740060248; cv=none; b=kn6JfZcereITGIwH3Y1ND/cLkvaTfGMyPmkIKG0wUx8yLNf8sbz0yhS3LYh33GFPIAMC+4qIukAF2ePArxUEeDdAuIMJIApRu/ukebiJvK++dw14sn3Cs6/JiQgLLM5cnjKIgjpRM1NcN64ohBx2WE9cAHnV7WhWXXo9edWAmRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740060248; c=relaxed/simple;
	bh=1WPnbZBbmWNWd7RE0EFiB3pJ9Vj3bQzBBImoaA4DNqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ty2Q3l7ZHwAdKfz5iQ+Oj0LgJYh3iH4x57DWX1YA2bxa+IzO9ibahyFEcJ9WMWtpJSvEbubpOVZPndZUkNMAPKaek/0Y6kv6Ho1PO5wm50ZRF/ZG4inWeHzC9MtuFGChbwE3s5nUU3DpEL6ckV7uaX23rN0B56RN7ezl4TfAuIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-systems.ee; spf=pass smtp.mailfrom=d-systems.ee; dkim=pass (2048-bit key) header.d=d-systems.ee header.i=@d-systems.ee header.b=H5GXyBwi; dkim=pass (2048-bit key) header.d=d-systems.ee header.i=@d-systems.ee header.b=H5GXyBwi; arc=none smtp.client-ip=213.180.31.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-systems.ee
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-systems.ee
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-systems.ee header.i=@d-systems.ee header.b="H5GXyBwi";
	dkim=pass (2048-bit key) header.d=d-systems.ee header.i=@d-systems.ee header.b="H5GXyBwi"
Received: from mail.d-sys.org (localhost [127.0.0.1])
	by mail.d-sys.org (Postfix) with ESMTP id 95BE760A41;
	Thu, 20 Feb 2025 16:04:01 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-systems.ee; s=mail;
	t=1740060241; bh=1WPnbZBbmWNWd7RE0EFiB3pJ9Vj3bQzBBImoaA4DNqM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=H5GXyBwidRNlHyyxvq4sKv1V0aipvW4jnCL4t7gpCg8NobPrc7UaQ/Snufn0gHyVj
	 BvFsihopn01OySiTBL4w76pJstVW1MmEBkoAV3Igdcr5S1FWpQSaSniOA79vIpuTtf
	 tt1pPG3agfMv/keisVUEaZ/KQnOW7U1EhIJceVcvBeY86pNuNTjgpBKrOUYNCOvxOs
	 A6xC4kaYYl0CzBchxnAKwp3+tgnPfaVngGHeW+2NAddiCeG7xVXr5oUb8HBJt8i5Z9
	 43obXxAwmgaEYiZ6t1+sGay2PXdfywzeH+skrvcDQjVRXLXsL097Jm9OqLVw+LbumN
	 QFheNDtyUXw3A==
Received: from [10.255.10.44] (GW.ds.local [10.255.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.d-sys.org (Postfix) with ESMTPSA id 866E1609FC;
	Thu, 20 Feb 2025 16:04:01 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-systems.ee; s=mail;
	t=1740060241; bh=1WPnbZBbmWNWd7RE0EFiB3pJ9Vj3bQzBBImoaA4DNqM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=H5GXyBwidRNlHyyxvq4sKv1V0aipvW4jnCL4t7gpCg8NobPrc7UaQ/Snufn0gHyVj
	 BvFsihopn01OySiTBL4w76pJstVW1MmEBkoAV3Igdcr5S1FWpQSaSniOA79vIpuTtf
	 tt1pPG3agfMv/keisVUEaZ/KQnOW7U1EhIJceVcvBeY86pNuNTjgpBKrOUYNCOvxOs
	 A6xC4kaYYl0CzBchxnAKwp3+tgnPfaVngGHeW+2NAddiCeG7xVXr5oUb8HBJt8i5Z9
	 43obXxAwmgaEYiZ6t1+sGay2PXdfywzeH+skrvcDQjVRXLXsL097Jm9OqLVw+LbumN
	 QFheNDtyUXw3A==
Message-ID: <f28bbd5e-37ff-43ac-9338-8f5becb0c43d@d-systems.ee>
Date: Thu, 20 Feb 2025 16:04:01 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: intel-hid: fix volume buttons on Microsoft Surface Go 4 tablet
To: Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.co,
 platform-driver-x86@vger.kernel.org
References: <bea773df-9fd0-455e-87c9-d46f9d5b6feb@d-systems.ee>
 <c455b3c7-f408-4d7c-979f-83f07f94e845@d-systems.ee>
 <e0f47976-622f-4903-98a4-ace0317dada1@redhat.com>
Content-Language: en-US
From: Dmitry Panchenko | d-Systems <dmitry@d-systems.ee>
In-Reply-To: <e0f47976-622f-4903-98a4-ace0317dada1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AV-Checked: ClamAV using ClamSMTP

Dear Hans de Goede,

Thank you for the reply and suggestions. I have obtained kernel sources 
using distro's packet manager (apt-get source linux-source) for the 
running kernel in order to build single module. Building the whole 
kernel on a super low-power device is not an option. The distro's source 
is not a git repository. Is it possible to provide patch without git? Or 
the only option is to git clone linux source, replace hid.c and git?

Kind regards,
Dmitry Panchenko

On 20.02.25 15:47, Hans de Goede wrote:
> Hi Dmitry,
>
> On 19-Feb-25 11:08 PM, Dmitry Panchenko | d-Systems wrote:
>> Hello,
>>
>> Volume buttons on Microsoft Surface Go 4 tablet didn't send any events. Adding Surface Go 4 to button_array_table fix this.
>>
>> The patch is attached.
>>
>> Signed-off-by: Dmitry Panchenko <dmitry@d-systems.ee>
> Thank you for your patch. Unfortunately this is not in the correct format
> for submitting patches. It is close though, good job for a first try.
>
> To turn this into a proper patch, make the changes from your attached
> patch to a git clone of a recent kernel tree (e.g, Linus Torvald's tree)
> and then after making the changes do:
>
> git commit -as
>
> and for the commit message use:
>
> """
> platform/x86: intel-hid: fix volume buttons on Microsoft Surface Go 4 tablet
>
> Volume buttons on Microsoft Surface Go 4 tablet didn't send any events.
> Add Surface Go 4 DMI match to button_array_table to fix this.
>
> Signed-off-by: Dmitry Panchenko <dmitry@d-systems.ee>
> """
>
> and then do:
>
> git format-patch HEAD~
>
> to get a 0001-xxxxxx.patch file, followed by:
>
> git send-email 0001-xxxxxx.patch
>
> to send an email.
>
> Note this also requires that you first setup a ~/.gitconfig for your
> name + email, as well as send-email config, e.g. I have:
>
> """
> [user]
>          name = Hans de Goede
>          email = hdegoede@redhat.com
>
> [sendemail]
>          from = Hans de Goede <hdegoede@redhat.com>
>          smtpserver = smtp.corp.redhat.com
> """
>
> Or alternatively I can send a v2 patch for your putting things in
> the right format.
>
> Regards,
>
> Hans
>
>

