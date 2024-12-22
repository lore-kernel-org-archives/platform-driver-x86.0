Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA771376E0;
	Sun, 22 Dec 2024 20:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734899713; cv=none; b=CfTtidwop5u8bAh7BbVaKL1dYUe/CwXoJNRj9m+V1DJEstTzmcZV6scYlH7UFQP/u6V3hAjJReDjuGRWcpQkJMRUUsy2gskWwjkKqOk6xqJXV0lQ8YkaNUhmTYJvSt00/6eclSjNjdIstcP9+JxbbL+cKmQWw0JnzZqS6ecRNNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734899713; c=relaxed/simple;
	bh=nN756ijIC+VOpDKXJ3Nn7khnugDD2m/+2YOmuFs05K8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aQ9WieJjeRgYJpLtjwUedzuyq8/XcoFEzr0H/WwZvKqlvvbbVqjlTdqtLzvYMNdPwLb2azheNAgysP2Y4FMi00rZwmwX/6IqHwaIEb/sMBc0bm0g0fBVrammAuTdrDYgL7hDc9H2yE7tF/eYpRLO4SQx1HEOjLbRC47YwxxlNlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHjJbdRo; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHjJbdRo"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6dcd4f1aaccso55058006d6.2;
        Sun, 22 Dec 2024 12:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734899711; x=1735504511; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vM6TI83urXYiLQrdbWfkbIN+h68g5TIrOGWn2vRCO1M=;
        b=XHjJbdRouzpQJ/YPiD2gUr2KBiaxIDzW7/zOucMDj0wnFwyf/wmdw9ZSvmrkS7t72W
         itDFkHXP0GIBMtjjmsfSZuRB1uPIqD1mvogNxKiu740MXFM/gBvOTwuVgVpMXu8KB+TF
         0kZAUd0rENj//M8Lv2y6q9Hq3Dc42e0zXZQtnA++Xb/2YZnU2oWQJug91AK74No0eLm+
         NYZtEF3oPRBtp/aFpfxtxmZY8GzvXBJSIYTPcZK05tthXcZPSLZseFVbU4O45n7boeyD
         mVgmJkw1WkhzhTUlofE5nQvSNsfNhoZjpGt1rj2z/yDn7cAasiG2PjZFsiWexc1mxmpo
         L8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734899711; x=1735504511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vM6TI83urXYiLQrdbWfkbIN+h68g5TIrOGWn2vRCO1M=;
        b=HpLUex+B79WDmoVY6mqNMbUF54so3TmUoVRa1kaWbtIPmRDiMfR1UYYOD6uvIBZy8G
         gBty2QajnVPmoM5dD8UxRuZ5dUUoFRQtuRJt3PCmWRWZP7gViSw+sZpFVZj/m2D24LWR
         w/tA1bQZB0fITGIhqCij5d7dJWu3i2XSA0sgCwWvHU0NrbgVnpLG7kltPVs+S+baN232
         4TPfAohYcz1Vvj3RbY7E3c809QInliEo0e6Yeh1I0X15cYwxRGyTN77N3+I5rKQA/dUy
         BI0flpM4ibbSG5gR0e8Uq71AUIm5h//9xYrMCoHpFqUjK7NUZ5f3XWFHLiTbLMS4bA4P
         CujA==
X-Forwarded-Encrypted: i=1; AJvYcCUU4hizNjg42r8BQVNsJaJc7wnbBtkKf5lUL05Gxq8WXu9nlGCsVC3tZ0RFGQ/5FVSwM2IFJRhzIveQRhI/@vger.kernel.org, AJvYcCWm32OjEiJf6UMIfbBtjlCX6Sjy5n76q9/hdBTa7ruyhgEbZwWY8JYPACMCi046qITvS4WNgkVHEis=@vger.kernel.org, AJvYcCXCoPxl0cRU/+dDWBdvb6z4IG5dJh51mmfwqK3uAA1qy0vOBoU1hMY5tdWiuU0sM5PheXzBlblnBgzCfiVh+5s+6iUBLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhYgH0Swxf1kclUaPueHwOCJcGkFGAfoXuw9JEsL5ymOqr7CMo
	wE1eRRW8/TrRpI+pB1TA4t5ak6+m5VEedn9IM6H/Ou+KOVp7oJBGQDYbHr1RommooAzaQbo948n
	CCfIb94JPoP8xj6AB+JwWSf0T6dk=
X-Gm-Gg: ASbGncujHVx3GsmNW0Uu14868sS8QftF2lYy0M9nmLOBIMdbOWLvI2UoG7MiOgb2jRS
	GTTyU5PMh5cAHIdfsymoG66dcIfCedIhKfWzlvIg=
X-Google-Smtp-Source: AGHT+IFz3EBCQXfJLMKj03Q+fD0SLujnQJ0+nUbFTt6j+jnKba2P/IVyGe9hfMTwS9Sxg/3QG+2GhW+02gGFiN+5txY=
X-Received: by 2002:a05:6214:400a:b0:6d8:7c82:e542 with SMTP id
 6a1803df08f44-6dd2331a3famr172034006d6.4.1734899710617; Sun, 22 Dec 2024
 12:35:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217230645.15027-1-derekjohn.clark@gmail.com>
 <20241222084216.1420666-1-johnfanv2@gmail.com> <CAFqHKT==PiLb_VuFPHJzgfrprukGGig+iUzcih+3TJ1VYt94Dw@mail.gmail.com>
In-Reply-To: <CAFqHKT==PiLb_VuFPHJzgfrprukGGig+iUzcih+3TJ1VYt94Dw@mail.gmail.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Sun, 22 Dec 2024 12:34:59 -0800
Message-ID: <CAFqHKTkog0FtGu2gf=_tfzX62xgFqjgDdz3CYNHCW4fCxwar_w@mail.gmail.com>
Subject: Re: [PATCH 0/1] platform/x86: Add Lenovo Legion WMI Drivers
To: John Martens <johnfanv2@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	linux-doc@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	Luke Jones <luke@ljones.dev>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Xino JS1 Ni <nijs1@lenovo.com>, Pierre-Loup Griffais <pgriffais@valvesoftware.com>, 
	"open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>, Mia HZ1 Shao <shaohz1@lenovo.com>, 
	Mario Limonciello <superm1@kernel.org>, Zhixin ZX36 Zhang <zhangzx36@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

All.

Sorry for the spam. My mobile client switched to HTML mode and I
didn't catch it yesterday.
Resending my last response plain text so it gets posted to LKML properly.

>> Adds support for the Lenovo Legion series of laptop hardware to use WMI
>> interfaces that control various power settings.

>Note that there already is a driver for Lenovo Legion laptops that I
>wanted to merge upstream.

>https://github.com/johnfanv2/LenovoLegionLinux

Hi John.

I'm a fan of your work and did consider working on getting your driver
upstream-able before moving forward with my own. After reviewing it I
found there were too many changes needed which would have ultimately
required a full rewrite. For this initial driver MR I only intended to
add the features and models that Lenovo specifically asked me to
implement. I'm treating it as a platform baseline and I plan on adding
additional features in later patch series'. I fully encourage
community involvement in expanding this driver as I won't be able to
do it all on my own.

>Compared to the proposed patch, it has the following
>advantages:
>1. already popular and tested by thousands of users
>    - many stars and discussions on github
>    - patched into multiple kernels of gaming-related distros
>    - packaged as dkms module for almost all relevant Linux
>      distributions including Debian by other developers

Those DKMS packages will need to blacklist these drivers anyway, so
they should remain functional for anyone who prefers the out of tree
driver until there is feature parity.

>2. supports many different Lenovo Legion models starting from 2020/2021

I would gladly take any assistance with hardware I don't have access
to. I have structured the driver such that adding the additional
interfaces and features should be simple. Since a lot of the
historical data is available I expect a fairly rapid development
timeline going forward.

>3. supports a lot of more functions, including fan control, which is the
>  most requested feature

I'm aware of the user's need for fan control, this is planned as the
next feature once this patch series is accepted. Other things I have
planned are hwmon sensors and lighting control. I don't think feature
parity in the initial driver is a reasonable goal as that's
essentially a moving target that would take many months to write and
test. As I'm sure you're aware, maintaining a kernel patch through
multiple kernel versions takes a lot of effort if the subsystem is
active enough.

>4. supports the many changes between different in the WMI/ACPI method
>5. actually shares some credtis with persons who revere engineered it :)

I appreciate those efforts, many talented folks have done some amazing
work and I don't want to take anything away from them. I just want to
note this driver isn't reverse engineered as Lenovo have provided me
with the full WMI spec to create it.

>6. support by GUI tool to configure it all

>On the other hand, my driver has the following disadvantages:
>1. The version of master on github is the most recent one and contains
>   a lot of debug output that has to be removed (often indicated by TODO)
>2. It is all in one large c file instead of organizing it neatly into
>   multiple files.
>3. It was modeled after the ideapad driver instead of the newer ASUS
>   driver.

>A few notes regarding the many changes of the WMI methods that I tried
>to deal with in my driver: note that in almost every new model a new
>WMI method is used to control the same functionality (e.g. fan control
> or powermode). Additionally, often the constants or the unit changes
>: e.g. percent or rpm for fan speed.


>> The driver has been tested by me on the Lenovo Legion Go.

>The driver on github has been tested by thousands of users.

>I suggest that we maybe combine the two drivers before merging them,
>since Derek seems to have more kernel patching knowledge and I seem
>to have more worked on all the Legion laptops.

Based on the sheer size of your driver, I think a change as large as
that will be too much for a reasonable review on the LKML. Your driver
is over 6K lines and that will expand a bit when doing all the
necessary things to break it into multiple files and switch from
depreciated methods, add additional safety checks, etc. In my opinion
it would be better to add each interface as its own patch series (e.g.
custom mode and lighting, dmi specific functions, etc.) as that will
be much more manageable for review and easier to catch bugs.

All that being said, I'm certainly open to collaboration on the future
of this driver. If you want to contact me separately, we can discuss
it.

On Sun, Dec 22, 2024 at 2:09=E2=80=AFAM Derek John Clark
<derekjohn.clark@gmail.com> wrote:
>
> >> Adds support for the Lenovo Legion series of laptop hardware to use WM=
I
> >> interfaces that control various power settings.
>
> >Note that there already is a driver for Lenovo Legion laptops that I
> >wanted to merge upstream.
>
> >https://github.com/johnfanv2/LenovoLegionLinux
>
> Hi John.
>
> I'm a fan of your work and did consider working on getting your driver up=
streamable before moving forward with my own. After reviewing it I found th=
ere were too many changes needed which would have ultimately required a ful=
l rewrite. For this initial driver MR I only intended to add the features a=
nd models that Lenovo specifically asked me to implement. I'm treating it a=
s a platform baseline and I do plan on adding additional features in later =
patch series'. I fully encourage community involvement in expanding this dr=
iver as I won't be able to do it all on my own.
>
> >Compared to the proposed patch, it has the following
> >advantages:
> >1. already popular and tested by thousands of users
> >    - many stars and discussions on github
> >    - patched into multiple kernels of gaming-related distros
> >    - packaged as dkms module for almost all relevant Linux
> >      distributions including Debian by other developers
>
> Those DKMS packages will need to blacklist these drivers anyway, so they =
should remain functional for anyone who prefers the out of tree driver unti=
l there is feature parity.
>
> >2. supports many different Lenovo Legion models starting from 2020/2021
>
> I would gladly take any assistance with hardware I don't have access to. =
I have structured the driver such that adding the additional interfaces and=
 features should be simple. Since a lot of the historical data is available=
 I expect a fairly rapid development timeline going forward.
>
> >3. supports a lot of more functions, including fan control, which is the
> >  most requested feature
>
> I'm aware of the user need for fan control, this is planned as the next f=
eature once this patch series is accepted. Other things I have planned are =
hwmon sensors and lighting control. I don't think feature parity in the ini=
tial driver is a reasonable goal as that's essentially a moving target that=
 would take many months to write and test. As I'm sure you're aware, mainta=
ining a kernel patch through multiple kernel versions takes a lot of effort=
 if the subsystem is active enough.
>
> >4. supports the many changes between different in the WMI/ACPI method
> >5. actually shares some credtis with persons who revere engineered it :)
>
> I appreciate those efforts, many talented folks have done some amazing wo=
rk and I don't want to take anything away from them. I just want to note th=
is driver isn't reverse engineered as Lenovo have provided me with the full=
 WMI spec to create it.
>
> >6. support by GUI tool to configure it all
>
> >On the other hand, my driver has the following disadvantages:
> >1. The version of master on github is the most recent one and contains
> >   a lot of debug output that has to be removed (often indicated by TODO=
)
> >2. It is all in one large c file instead of organizing it neatly into
> >   multiple files.
> >3. It was modeled after the ideapad driver instead of the newer ASUS
> >   driver.
>
> >A few notes regarding the many changes of the WMI methods that I tried
> >to deal with in my driver: note that in almost every new model a new
> >WMI method is used to control the same functionality (e.g. fan control
> > or powermode). Additionally, often the constants or the unit changes
> >: e.g. percent or rpm for fan speed.
>
>
> >> The driver has been tested by me on the Lenovo Legion Go.
>
> >The driver on github has been tested by thousands of users.
>
> >I suggest that we maybe combine the two drivers before merging them,
> >since Derek seems to have more kernel patching knowledge and I seem
> >to have more worked on all the Legion laptops.
>
> Based on the sheer size of your driver, I think a change as large as that=
 will be too much for a reasonable review on the LKML. Your driver is over =
6K lines and that will expand a bit when doing all the necessary things to =
break it into multiple files and switch from depreciated methods, add addit=
ional safety checks, etc. In my opinion it would be better to add each inte=
rface as it's own patch series (e.g. custom mode and lighting, dmi specific=
 functions, etc.) as that will be much more manageable for review and easie=
r to catch bugs.
>
> All that being said, I'm certainly open to collaboration on the future of=
 this driver. if you want to contact me separately we can discuss it.
>
> On Sun, Dec 22, 2024, 00:42 John Martens <johnfanv2@gmail.com> wrote:
>>
>> > Adds support for the Lenovo Legion series of laptop hardware to use WM=
I
>> > interfaces that control various power settings.
>>
>> Note that there already is a driver for Lenovo Legion laptops that I
>> wanted to merge upstream.
>>
>> https://github.com/johnfanv2/LenovoLegionLinux
>>
>> Compared to the proposed patch, it has the following
>> advantages:
>> 1. already popular and tested by thousands of users
>>     - many stars and discussions on github
>>     - patched into multiple kernels of gaming-related distros
>>     - packaged as dkms module for almost all relevant Linux
>>       distributions including Debian by other developers
>> 2. supports many different Lenovo Legion models starting from 2020/2021
>> 3. supports a lot of more functions, including fan control, which is the
>>   most requested feature
>> 4. supports the many changes between different in the WMI/ACPI method
>> 5. actually shares some credtis with persons who revere engineered it :)
>> 6. support by GUI tool to configure it all
>>
>> On the other hand, my driver has the following disadvantages:
>> 1. The version of master on github is the most recent one and contains
>>    a lot of debug output that has to be removed (often indicated by TODO=
)
>> 2. It is all in one large c file instead of organizing it neatly into
>>    multiple files.
>> 3. It was modeled after the ideapad driver instead of the newer ASUS
>>    driver.
>>
>> A few notes regarding the many changes of the WMI methods that I tried
>> to deal with in my driver: note that in almost every new model a new
>> WMI method is used to control the same functionality (e.g. fan control
>>  or powermode). Additionally, often the constants or the unit changes
>> : e.g. percent or rpm for fan speed.
>>
>> > The driver has been tested by me on the Lenovo Legion Go.
>>
>> The driver on github has been tested by thousands of users.
>>
>> I suggest that we maybe combine the two drivers before merging them,
>> since Derek seems to have more kernel patching knowledge and I seem
>> to have more worked on all the Legion laptops.
>>
