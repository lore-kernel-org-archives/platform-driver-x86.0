Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879711;
	b=WawpD9QY/Y8HwR7jMNfdVLCuS3z0JUoEUNeyBqEC+EKsLrBhZ9nPJp+pbSC7STRLcaQQ
	 bWWqba11NIZfVzu1nPG49Duy7FECQqXt3/yl5YP5wihkdRIoxZEBpP6bgYgAsp7sAvBMC
	 CmjneCd/SId6Zo9AyK6B88G7W9QtLKrdIRS1ZPy5xBG8N3rWQJ0RLqiAedsKWf4PN9RZJ
	 +KDVcAPiB+jDQYmvqjnE9flvnJVzk/isCsLlu4iB/qy3dzCW3xBO5e6EkOR0fgsRRlY8L
	 6FaGJv4BEkdPDNvG8OiyT2j3tP2gOcjxrW46a26v4racTfm6/sAm0oUfWzFEmZgpvKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879711;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=zpVODJpEGPN2vfl83cAegXeN7oACXWdxf+YqHqY3aGY=;
	b=G3PEuMIAefx5mPALKuTo48+LgUR4LtFhfH08hPSO2sckBjTV8qtfxPYZGF8SzkYNm2AX
	 WSOmDKxN6j9SuK0B09tJOXvd+XO0nC7tPZqmRMZlUgLbC0DeYaY1Lva/bH4UDLRbCcUkT
	 63RXlKCslAUdOxSCLMvGZSLCAiDrDUlwj2kU+tApDpg6pzeDqcOmA9m3Mpa5CEzL0XQ5y
	 ujuS7Gz2Q6a8gZ0krwa7UJZyAeKznoKaXixsNsM7GY7zT40zwMoS+LJK6pIpyXcXfDj6s
	 8whElxyNR5ZUIQeL3p+J3tp3LjqyekOopYmss+boCXtBTxZ4R2rMWk34QwiAo7jR0kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=VQXt3RYH;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07862606A31C
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 01:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07862606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=VQXt3RYH
DKIM2-Signature:  i=1; m=1; t=1794879707;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:MTS21KSQLM1Y58yP+rg2qbl+QI8u
   hQfQZDMHvrjJp6ALDq3e3ypr7gIEHhIdd69q3Y00smgSDCFQf2WYRKKTc/LlI7P6Mq64jLnoAbI
   Cp7hbdzc91/TrVKILhRD10CWDRcsQkkyQK5QaHTjXHZnyLBpmUcizjplJCxIwrwuDZtun+grMB1
   JbULbuzMrY0iNFQbfv7LAdfB/Dow0//KRp57zOYNhqk3lcG4eVoTr8t6TQL5gCV04UjTaTQJOtL
   kn5lpJNQwJvp4HFmYfOrx4JefBh1fDSkdoC4in4R07a/ZSZdmd9Wf9/tmjej0MTHckqIUEItbwP
   /iEC6PxXwOYvrQ==;
Message-Instance:  m=1;
 h=sha256:
   0Ghc4Mo/TLUwykvVAX0Z0OJjTXyx0dqXYkotUBHQgyA=:
   G4lupC7uz8nyROGgnRU43UPE3SXEfGLOfBJdSSqxjHU=,
  sha512:
   BbiS5Q+ianPZewTVzTNyWByCaF9yEzAjrlenEd6PvADJZBU3hpKONl9L4yOoh8trEQYIaAU91DWSQGDh2KPtMQ==:
   rFaOq/gwNQxnEy6UlhTVcnQIbTi703bbGQTQt0c4vapTOyQZEkIglA5gG9zIjMNguVnMK7kv/HOp4qWN665MTQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794879707; x=1795484507; i=w_armin@gmx.de;
	bh=zpVODJpEGPN2vfl83cAegXeN7oACXWdxf+YqHqY3aGY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=VQXt3RYH4LaMxeo7meWPXD8rSSMS3yNUzdj0zSTJF/FdC6YKMZWTORCYibVZizfd
	 VoF027R8Foex/UrQaipvLqLYAFbbwgBr6SCsdWttjiJOCnm9VkfrjgTkPLfVjwuVn
	 tn8Uf4iXTA9SAF1xnNl3As1/298RaZg69u1piEILDfamxSVxL9Sj14Bpk2YP0G1zb
	 /TkPCjrF7VAPfbfz+3DH/LUU3ZAY8aTWR4vm6X3VSfA3EOz/9O20iHhHJBsv9Ar8S
	 D/Hz4KMZafDTajBQ7nSIR1144iycHz34XbeD5+SK4tN6vAUSUlNTLeX6Czd3Jn3IM
	 GIr9stSWphbd4Jw9Jg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2O2W-1xRUqD1BvS-005rlp; Tue, 17
 Nov 2026 02:41:47 +0100
Message-ID: <d6ef8523-6e72-4fba-bf99-3cc24ff41af7@gmx.de>
Date: Tue, 17 Nov 2026 02:41:46 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] platform/x86: lg-laptop: Windows key not working since
 native ACPI events
To: =?UTF-8?Q?Adrien_Verg=C3=A9?= <adrienverge@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CANsc=4Uec03px3_Q+4YQDwL9H5FugS_QyEGPKAOy0Nq5tTOmPg@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CANsc=4Uec03px3_Q+4YQDwL9H5FugS_QyEGPKAOy0Nq5tTOmPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wwis/VPEc8ZABFSVnoJgEz08CzKPe5crkwUa52msqQ26Z6+Lzji
 ia4qJnDUlwA/pCbCcdi99NdEQRJUSONgwdK45Vo4GDauCwuh+Ikja9bgoVMoW8hdp/15SRc
 Z+5a+LdBuKj0KJgTxnmg0X7iZFkp39SSr4w4D8jq/nSO1b7GgNxPk0crEqhkfhTJU2msY8F
 kOSDwIVa5AJUCAkNDtNTQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SaXudXQ7T0I=;SFGnYv7E4N9SZnh/+hYSkJBjVB3
 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

Am 16.11.26 um 10:34 schrieb Adrien Verg=C3=A9:

> Hello,
>
> It looks like commit ad873d634095 ("platform/x86: lg-laptop: Add support=
 for
> native ACPI events") broke the Windows key (meta / super key) on multipl=
e LG
> Gram laptops:
> - Pressing the Windows key doesn't trigger any action, e.g. showing all
>    activities under Gnome shell or opening the Application Launcher unde=
r KDE.
> - Randomly, pressing the Windows key multiple times in a row (between 5 =
to 20
>    times) does trigger the associated action.
> - Pressing the Windows key in a combination (e.g. Windows + L) does work=
.
> - Soft-swapping this key with another (e.g. =C2=AB Alt swapped with Win =
=C2=BB in Gnome
>    Tweaks) allows bypassing the problem (e.g. pressing Alt key shows all
>    activities, like the Win key should).
> - All other keys seem to work fine.
>
> Impacted hardware at least include LG Gram 15 and 17 (see
> https://github.com/CachyOS/distribution/issues/619):
> - LG Gram 15Z95U
> - LG Gram 17Z90TL
>
> I bisected the bug to commit ad873d634095 ("platform/x86: lg-laptop: Add=
 support
> for native ACPI events"), which appeared between Linux 7.2 and 7.3.
> Additionally, reverting this commit on the 7.3 branch (along with commit=
s
>   543efc52befa and 9f5724492217 that depend on it) fixes the problem.
>
> My knowledge in ACPI is very limited, and reading the commit, I don't kn=
ow what
> should be fixed. However, I'd be happy to help and test patches if neede=
d.
>
> Thank you for your consideration!
>
> Adrien Verg=C3=A9

Hi,

take a look at https://lore.kernel.org/platform-driver-x86/20261103180750.=
228116-1-W_Armin@gmx.de

Thanks,
Armin Wolf

