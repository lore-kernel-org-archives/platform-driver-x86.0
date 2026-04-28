Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6019E40DFDF;
	Tue, 28 Apr 2026 21:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777411014; cv=none; b=Snq+BE/Hl6sg7cI/ioO8uZ/P2H3FirV0GQvAsIFeBpEyZbrYkXXKGT6GLOPkHqYZ4/cdnov8YdPUscpNK2UzgplXnuyF4tzoxltPzxdb1M9k86b9lwLx6xhWhzfY2Y0LIA0E0g461MHCxqyiZk2Ak07/j3Yl83+AJRcZk6vKz/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777411014; c=relaxed/simple;
	bh=H3kojnOXfYGiqF+yEGc95nJfjpLqtMg+KboIV/fY6So=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=beRkYtvNLn5SbpN60nCMTwKIJVh8CFxNrR6X+n/H6Zz0cBhOezUgKpcifuLOgItR2fHQmlcnOBamt9uJi4vH+rG9QxdavJFOFMxYMpi60Cp48pZSMwpZT+I7pFSUl7KQfXv+faBw68bSmY1asaMaRtUXbeqG2twxe2HObwi5YYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=fpQJQLVt; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="fpQJQLVt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777411010; x=1778015810; i=w_armin@gmx.de;
	bh=IUs16122EVGFgTWjJDZm6E9JJmeQG2LvOdSbrcWci2s=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fpQJQLVtEtCAPhhgGjfbDZkKaS8Q6drevByt1GowhsHLurkdrdUI89TBQTzMybOx
	 XEAHS/bBswsVWWRCbHgrY3e+w4KLVgdGh3q/cxKyyasUw0rUqvyQ4Ob501R8ME86Q
	 UVR9n3l65z7evhU3/VwCk5+3IMKCjfCx0ZJyldwI6QQwS5KETevHKyn2nuA5OvFVh
	 IPp0BYe6b57CIP16Cyk5IEnnWNPYzlNKC+FR5VVgw1oJyfJcTgnHKRo/IeruBVv/Z
	 Hg87U9Yg5IU3EKL4tnrsfdKZd3+Mv4TgrxCGXIwWWTbM4GCnEPbByn9ygCkKgoHlj
	 Tvdbt3GMkHDmdbsruQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2O6e-1wLh9Q21XS-00B7G7; Tue, 28
 Apr 2026 23:16:50 +0200
Message-ID: <dd9114dc-2bf7-4167-8697-445974daee49@gmx.de>
Date: Tue, 28 Apr 2026 23:16:49 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86: dell-dw5826e: Add reset driver for
 DW5826e
To: Jack Wu <wojackbb@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420060029.1754854-1-jackbb_wu@compal.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260420060029.1754854-1-jackbb_wu@compal.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7LrGOIac+mtDJ/FWOWs8k4MEMOtCoZye7vMHU1RV2x/f2S8r7xM
 ZJ36+An/y/R6r3wbI8PAz9qzzFuAyZcWvw6T4i3Bgtuh6O7oaQ5Suo4VwTp5L+7EnUAclyz
 6BxctUzj7eW5UCn/AlMNN02mAN5onC3V1riNqLsZ1ymw6/lY5cZ7zrQybmN/H4SoayumVtu
 vfKozmjlPYvey7sp1f57Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:N7pgUdtPVi0=;wqwKov/sP2iZ/jfIdX46PP3KpU4
 RQA5+iXtAf5mleeRfiDGQn5DXRfzDKG38yvEIkGXV9GnCPxQc82QfGYTdLpISVMlul57jF6cd
 Fb1EKI/hJYfsvrt2lEFsuOnHEvC+8e15ZvRiOp1CrC96ZIJzREcTQpwKgcf0mm/jJxu+85DOK
 9Kv2DfR4YZ22DvcbD/EuWdNVx5lIfr9XhVd9OjZ5pFxd7FFpQHp6cxUb9qcr8UNLcgQB1JoN8
 2sLFJ0i5v2qcoLhHbIwB0kFZ7N+A7uxr1gbQv7Uz82/9uuRpqMN4CQFDABE5eco7C1f5VlenG
 m8JJKVU1pVgdDzsRKk9mPk0OcLyewnqqlXVpO7ArofftERJK94PFKjKbOVXhpEJv2/lHkKRvV
 2ixKD/Kf5yxzDAHvSKs/jFzS/t4MR6dmBg1MosBF8i13pd3HFDcUit77B/RQm4ngWmACPAoKN
 kdNarISLOni+pbuVPZ8/Htc6yaCCJ+j26KY1aMplW/ViwaKGBINGGa4yjeTZB5VoQVHr48r0Y
 36pP0UupCu3gbhkOmRfrci0xL7a2r/+7C+NTSzqdmbLEHKtuB1v9f+mh9NDt5OM0u2sY6NPWR
 aoXjiDq/QNDORlf2stL+QinxQqsx6nCezAjRIQcnzRn6yvkpNKEDBYVrjbIRkvzyzCvgklCGW
 mwHIVfYcvEwx8h9glViIQxhOAPnUM3DvFNF1mzB0ln5pU/nCFhckXATl3LpeIOfzWoJSa/7hX
 2/rAd2L5zDlLj5wIHImxBQHSuowSCkO4HKze7NjuwTACNjlQ+DL31zXlaatrcM+iWr6w5rYY5
 WgIYeNyLoEwr9CRs0pcmWd7kRLmD7+n0ENyvCp2YOQ521lXPj3sPb25ctXrxiNWM7ex8qk8er
 ybTuXPg/OuOPXdCLjYPuHcIyCixjBccPg0Fyml07K0E0C1YxtI+99ksdCYT844XHE4pIDfypn
 8Y4MQPewqrHqYIzJD2J+cR/JxGnaHOEsaaJxeMQiMTG93WbzoTuxIAfdy00ayVVC86uT/h4SP
 MxQP3P6BVQ2ZEJIcpzmznkygcBm5XuaBGaZoBf4S74y/Aney4rWnzi1RFcWzk//uS56nV+VMr
 nyq4GvMtP44T1crmhZp1jm3ErDcNbfF1WfzaP5tqWIRW8NKqyLRKHL/YESAlZhEIJwbgkgk5N
 wJQGzOCGXN4whik7nKcQxrQ9Zyz40miLELEfvDqjy+3veRPKq2SZGKGu1QyUSOQ4JjHQOoMKE
 3kKY8MZbOMeR8pK8Fl9WDYHSIFhR4YQJHfnK1tL45KqCNaKhtbO6QC9d36uZgsOYlnrqvy1/1
 NbZ3u6B/YbO6SSBv0bShgOSuMgnt0hqPpbkxNoMlJskYlodLeji0BZwPy/b2oMSR8GfE1sIus
 kxE8xnmqOMH20mnz2it8TtAzUY5+qKNZaCEXk2tRKka1cooqsUuxixFd88iUCl4d3Tp+0Axpm
 U/5asHc1uAX5IJTCJLu3yR4/1djwepPuEYc2aj58TMcgFN1M3cE6BOeMdHp8cM2hK6iWL1XNx
 MFHpg6NTKwNuDbrm/B6puMEbd4caXeCbn9g18kQ4dJ+Yc0moZajOoE6jIvwqieORkvm1giXi8
 pA1vnV5H/IqZFJNBUYwGi4uyQXRdMuH0IuPRAhu5wYDf7MsJCCi07fRhdhtSwi2gka2OHX20c
 U8FXADjXRnCetJbgbOJHKuOiknPUpRIc9Ah5RGtffQNBCkbhhnEbSOsI2J3TDj1uEzYVeFF8p
 RFWKq9DWoEj3hyEGngl5UeU6GtQMUNTcLWI2oWZpmWv76KE5pTzlk/HGACK6GfFQd1v+OkuBO
 DY0nW4MsiVbbAzv5KY9aSmZVmR+iG3ScE14xezSm+uOrqAU7nFaqXdMDgweYyCzx33GNyYBEs
 xpQwfrGDCWVGupGFle/a9j+lYkyX9ySdRn0eI7h0SBp53IvKDuZvAVIbAtiaigw8nWa0fy3ZU
 lEEN3BK8qNc0kFAHvC0TgfmGSPG48fTXY3S5BkWC/EmyRedx7W1bahTI5R29K62bJNChF2tyG
 8U4KdXn559oVF6RT75idN/kD3ydlexGMzGdKj7SXIhsSTjXlrI0gwFfqrFmy8JsvDW34gqBSR
 kbuHs1FqJ7L6ykMlGGS1bAwKxCmc4htqX1aK/KF283gciRmIXVdI6dRgICsggZTfhsnQEEsqu
 7kKfgjjr7u1qR3EOBE/S3iQ5uOKaprXfZzLbHIKEkHUJozLRWqDTWwR0UZcdZK2TCgLr1O5q2
 XSgceNetsUnRWgzrYX3m+uii2qH0nuWVTJdhIkisGxgdz1m0NJN14+ptvdPxPP6xDm76IBSUo
 pXGFbaWUrSFAMWvtX2JKveHhlnS5QRBflte99TdumjSTEFpue6BHGLhytbN/lMVGOGlnFO9re
 sCZLYrdCvQ5tRM3Vom50Q3npNcqy/cCQTJaO5ydCRtS413STv45017x+2XP5nh/JbX/vMUFyh
 f8UMjThXiOwkxi4y4QJC5vDxjH3oc7yMkkjNgN7EJenJdhBwe5ZzspvsACQ17roI3j3OsKZmw
 U+7WhwThh1Li0r79puCCrTW32i63oyk0VMe7Vsh5Q23w3ZbOhGl2CKp+RD/VSPhd+2U4aWV4x
 Be5d3mguZXEi9PvcLgn4d/uFb2XI5bXZ4Z/+MeNmS3lTPoixfqEPH9Ih7HbRjPkC1wksUmZS6
 hIzo3Fll7du+jp1DyxyZhyD6Q24xJrOu3pGjmXwGU33m/eIPjYxMNXZGFG3Xqd7fmo+5z+4o+
 4oLBVwsOW4XBRBczjSJ02YWjK0KZ7C5KFQnJtFo1JKlJwmAi8NsxHBgeFARtwfy5pva3vbfiF
 XAztTkBmSI9riL3BmhCPw7NWHIMB0PI/J1KucnVVkQLYLZa1Kb35+djbA1I71PXXd6nvGYUxG
 DUfvtmpFkgJ9AncXriIRCMEhgVyUlO2FcT5jb5i1XukCXckCYzZNYjR2fmDXvFKyAwmdJTKOe
 eLnnFFTZbMNN5iGdbultFXlvoSJOBdmTaJ9K+Y5OrIRKEvkr+b1JZWD8xOn4qZlN8ZAvRqirC
 WwykukWGz/rhmoyHFcgaWNxlRFf1Tw1oClndeaSD73UEKSaG8Jf25vpJ45UJcJlmE+guemgAX
 uKPQApjo230OuOXUIgWDo6c4GWYCAzwXlkGaHeCOE7jdfXmv4sa34RtziVFM1msFPMXzxJPs2
 tQdHlvGxsAmocu7JsubMVhkjMbAESn+UOumco6xVJucL1EXVVLujwZFz97sxa5+M9u2/hznTW
 QHeyNyyS3hcjf+PBDD47HBKFqu+uvinqKvpgLZdMmuCoPIGivTkDJDLvhPfv8mASqfxe1Egsd
 gFWQqT2rolBL8wrQHmJAffZemnO82xpJhDgmjOujDqpPVeLh3yO2q8H+qCnlqRnB+PT+5r5bv
 tYkipVAWDHHcgaggNsjNET7WL6w1cI5b6zpSfAyreXsn0Z50d0oFXaIHP1MpC26zg+MFmZh8V
 LWZL4xz16HwmBTugKB2KPUPpEBbibstoy2J+orEoWkJSXIHxg0HN6s2kKkPr0g3PhsYB5k6Cv
 i+8T7vpiF18iiFli4sYlP9wQDP98zNnNDsgIUjilkeTI8K+bcSvuxOhRZioHUQUQk3cKMQJZM
 C5duuirSvqiQILqKB7iW6goIAWo4eEQzsfRd38MTyaWkgTFd9vqcc0UbuBlEVBLqmKND33WhM
 vo4JoeMvMsVcLPcPwmNoirPHktqHEumyXnVzDG4FZGMwJz0Whd6PSMC+5bBwCmFjIdb/c8CWa
 wMx2JAI+Ecn/jDFpnIDbCO9NDfsPsQbAnXNY4rdUtfcK2ftUgVdE/izPOeXt8C15y60IBIGnc
 dtp6F8Tmf6ZUJTtAqDiNtSLu6dGgJj/SnnO99OsRzvo4u3K5c3tFmgcdiTq1J38Igf/CYAfO9
 x8CF8+YRAuPlpHmXc5f6xRPmdAk+hD1MV6hP+kKITDyMzhFlL+RvjIWk0JyW5Iyp9Ocy06SGs
 vLJlL+/Jgy2Ti/EIGJaA3dhHy5j+WaWirsH6ulk23ycteV6LgvDIw3b/t7OIYLoTD4rlFXYAc
 LBlf6gpwAhdGboxZbZnxUsVibAKttD+BMj0Tq5VzPN08XjbSri07NedGaP9HmtC4nT3dXtu6U
 rkKKJLE05Ftep8+Lu7/0OlyCNw4l1RjGZahE+b70LdgPK4znCo6UgGTXaraq+kgGhTvmugBJ+
 No5fagU6Ib+IamHjiUxHvh+xXSMIvgvxwufPlSkYOCRwQYsNVML3dk3ovtLTu9lRuWk2aimaA
 kpvbMQHlRrcqTLaRWtJu6uJu85/VwNCmo7w9RXRHwJ8gVjgFSoG2IH3Nd/IPTsANSozyIzH9D
 pNA/juea07RNv93yQO1DAZYx7Vpc5tZrjTtYj7EkC/842Rm68LZnDgkPiuMyTJu4moNv2/kIJ
 eLb775i8qH9CXSxK13+XSEEvvGnI3lZu+YQ/L8ZhmKXm4AW4FB+lxTow7RZEL/sEx2pASTWuY
 sTbU0kQGyy1IO7XBcxGxsUJnFk87Xm7gOVvKCDlmWP+/JPB7rO1lMvO3gv+hTQkpGtMxxg0gD
 y5SjYfJj3KOcCuOa2WJFF4NtGaDHL34SuNn/Xl8WQoY+/bjlPjAaFcAm6stpR9nHCFvTTBAiQ
 kol4KzNPYOUVWw8qeNPVyMoo0etafBPHhsUD7cgqALANpEp/l3S5V5SBzRN+2dZmiwGTOraPv
 oCPPgX6f0ukpI/jf/7fGFvMCejhG0WRDUZ2TQV41bcUg33jN3WaI9KlvCYsa3vkG8aVK8780X
 t1P05oAauv5QkJzNxnF0T8GDJLG9Zyx7cCM3rlaL7T+QSkZJ0sYmAx7bxCocG0Azh1m2upch/
 recJ79Uo7yOvIO02lCGj8CqOV09cMGIUSrNxnaV3CAB7d53hlLELgEYoKuVZH4W1wBilItp8B
 MPn1WOrbEpww3frVmPjvVb8WmWRarbNj9EbCPnND1DXUPLVlXRWTyeHbbUeehIjpadEbv1XVs
 VevU+yvFcJgIPGqkRa5QH/jsYTHxouEKsYsDEr6FS9XNMawLpGGxwBgmgXJ3o0PTC6Dlp7SpA
 sy26R8thpRc/NM9xdruCMDq8Y6ZrLD8A+cPQ/8U80TrIN4dNimAo1cZLTQ0ohDXKTn0ogCKoT
 K9b0R83zkEnQr4A2YhK6WFVqHMcPUI5itHH0Gl8I2M3d1HGbBR3GI8t+hI+uoZDwpmAMvgRA9
 4bxA9R1oHFmLo6gMd3/JDSDiHZ8MxktzH41cwiIZtseJEefpjLFXmUe0NPO0rNhjNeeQD0ZoV
 T4a1GgDis/AmAUkn+6OAsin8AMsxNzdxY9p2bjSmu/f27EdA8WKV7F7r4PdBbD4/LjmX4zL/b
 g1c66UPAGjh5rPRM0sCPYMMnN/liJO+V8WaSK3XtFUyU8S9IahUXFnmkxQVyKfJ48CKnuItGR
 Lbo6Cm9RxUfq8k6z9WYnCy1Kc+it85vC7VSuk+W1Jo0sNs4Qzzyp3PIqgcdFOXitEr5MS3Vgp
 cJb+C6tSnkWpGSTJWc1BSV/yJ8PMITM8hUwq3Ijz4wWkjcBf/vV7+n88PqcROAYPtygG4q51v
 kqi1FquGIgfiQ5aW2hcLOdyX0qe1aSiFbxdMgcjEe5fvWcbP

Am 20.04.26 um 08:00 schrieb Jack Wu:

> If the DW5826e is in a frozen state and unable to receive USB commands,
> this driver provides a method for the user to reset the DW5826e via ACPI=
.
>
> E.g: echo 1 > /sys/bus/platform/devices/PALC0001\:00/wwan_reset
>
> Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> ---
> v4:
>    - Fix version of the ABI documentation to 7.2
>    - Add include linux/types.h
> v3:
>    - Rename sysfs attribute from "pldr" to "wwan_reset" for clarity
>    - Add ABI documentation for the wwan_reset sysfs interface
>    - Validate _DSM method availability in probe using acpi_check_dsm()
> v2:
>    - Remove extra empty line
>    - Add missing includes and Remove unnecessary includes, sort includes=
 alphabetically
>    - Remove noisy dev_info()
>    - Handle obj->type !=3D ACPI_TYPE_BUFFER as error with proper return =
code
>    - Replace miscdevice/file_operations with sysfs attribute (DEVICE_ATT=
R_WO) to reduce boilerplate
>    - Propagate trigger_palc_pldr() return code to userspace
>    - Convert from acpi_driver to platform_driver
> ---
> ---
>   .../testing/sysfs-driver-dell-dw5826e-reset   |  9 ++
>   drivers/platform/x86/dell/Kconfig             |  6 ++
>   drivers/platform/x86/dell/Makefile            |  2 +
>   .../platform/x86/dell/dell-dw5826e-reset.c    | 90 +++++++++++++++++++
>   4 files changed, 107 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-dell-dw5826e=
-reset
>   create mode 100644 drivers/platform/x86/dell/dell-dw5826e-reset.c
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset b=
/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
> new file mode 100644
> index 000000000000..a665e265633f
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
> @@ -0,0 +1,9 @@
> +What:		/sys/bus/platform/devices/<PALC0001 device>/wwan_reset
> +Date:		April 2026
> +KernelVersion:	7.2
> +Contact:	Jackbb Wu <jackbb.wu@compal.com>
> +Description:
> +		Writing to this file triggers a Platform Level Device Reset
> +		(PLDR) of the Dell DW5826e WWAN module via an ACPI _DSM
> +		method. This can be used to recover the modem when it is in
> +		a frozen state and unable to respond to USB commands.
> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/de=
ll/Kconfig
> index 738c108c2163..c4540c837a88 100644
> --- a/drivers/platform/x86/dell/Kconfig
> +++ b/drivers/platform/x86/dell/Kconfig
> @@ -276,4 +276,10 @@ config DELL_WMI_SYSMAN
>   	  To compile this driver as a module, choose M here: the module will
>   	  be called dell-wmi-sysman.
>  =20
> +config DELL_DW5826E_RESET
> +	tristate "Dell DW5826e PLDR reset support"
> +	default m
> +	depends on ACPI
> +	help
> +	  This adds support for the Dell DW5826e PLDR reset via ACPI
>   endif # X86_PLATFORM_DRIVERS_DELL
> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/d=
ell/Makefile
> index c7501c25e627..8150283cfd1d 100644
> --- a/drivers/platform/x86/dell/Makefile
> +++ b/drivers/platform/x86/dell/Makefile
> @@ -28,3 +28,5 @@ obj-$(CONFIG_DELL_WMI_DESCRIPTOR)		+=3D dell-wmi-descr=
iptor.o
>   obj-$(CONFIG_DELL_WMI_DDV)			+=3D dell-wmi-ddv.o
>   obj-$(CONFIG_DELL_WMI_LED)			+=3D dell-wmi-led.o
>   obj-$(CONFIG_DELL_WMI_SYSMAN)			+=3D dell-wmi-sysman/
> +obj-$(CONFIG_DELL_DW5826E_RESET)		+=3D dell-dw5826e-reset.o
> +
> diff --git a/drivers/platform/x86/dell/dell-dw5826e-reset.c b/drivers/pl=
atform/x86/dell/dell-dw5826e-reset.c
> new file mode 100644
> index 000000000000..4e0d64535abb
> --- /dev/null
> +++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
> @@ -0,0 +1,90 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  dell-dw5826e-reset.c - Dell DW5826e reset driver
> + *
> + *  Copyright (C) 2026 Jackbb Wu <jackbb.wu@compal.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +#include <linux/uuid.h>
> +
> +static guid_t palc_dsm_guid =3D
> +	GUID_INIT(0x5a1a4bba, 0x8006, 0x487e, 0xbe, 0x0a, 0xac, 0xf5, 0xd8, 0x=
fd, 0xfe, 0x59);
> +
> +static int trigger_palc_pldr(struct device *dev, acpi_handle handle)
> +{
> +	union acpi_object *obj;
> +	int ret =3D 0;
> +
> +	obj =3D acpi_evaluate_dsm(handle, &palc_dsm_guid, 1, 1, NULL);

Please use BIT() for the DSM method here. Also consider using a define for=
 the
DSM method index.

With that being fixed:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> +	if (!obj) {
> +		dev_err(dev, "Failed to evaluate _DSM\n");
> +		return -EIO;
> +	}
> +
> +	if (obj->type !=3D ACPI_TYPE_BUFFER) {
> +		dev_err(dev, "Unexpected _DSM return type: %d\n", obj->type);
> +		ret =3D -EINVAL;
> +	}
> +
> +	ACPI_FREE(obj);
> +	return ret;
> +}
> +
> +static ssize_t wwan_reset_store(struct device *dev, struct device_attri=
bute *attr,
> +				const char *buf, size_t count)
> +{
> +	acpi_handle handle =3D ACPI_HANDLE(dev);
> +	int ret;
> +
> +	ret =3D trigger_palc_pldr(dev, handle);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_WO(wwan_reset);
> +
> +static struct attribute *palc_attrs[] =3D {
> +	&dev_attr_wwan_reset.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(palc);
> +
> +static int palc_probe(struct platform_device *pdev)
> +{
> +	acpi_handle handle;
> +
> +	handle =3D ACPI_HANDLE(&pdev->dev);
> +	if (!handle)
> +		return -ENODEV;
> +
> +	if (!acpi_check_dsm(handle, &palc_dsm_guid, 1, BIT(1)))
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +static const struct acpi_device_id palc_acpi_ids[] =3D {
> +	{ "PALC0001", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, palc_acpi_ids);
> +
> +static struct platform_driver palc_driver =3D {
> +	.driver =3D {
> +		.name =3D "dell-dw5826e-reset",
> +		.acpi_match_table =3D palc_acpi_ids,
> +		.dev_groups =3D palc_groups,
> +	},
> +	.probe  =3D palc_probe,
> +};
> +module_platform_driver(palc_driver);
> +
> +MODULE_DESCRIPTION("Dell DW5826e reset driver");
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("JackBB Wu");
