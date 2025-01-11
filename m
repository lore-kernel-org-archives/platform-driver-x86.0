Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2773A82899;
	Sat, 11 Jan 2025 17:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736615596; cv=none; b=RaEvIVZ+2AUmh573ICS7pFgYPiwW1hyRZmNln1JbPiLTOpnhPKwMIO0DZAZ4n+Hw/fE4s1WmdHRagkyYqr0617FKqC5wyEwEYZ22BcfkcQsqV4YGyCvqbIckMRzsrWwdORv00P9H6JmT3W8o0AUjjzKqFhwak7CpFVMZrJjhOOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736615596; c=relaxed/simple;
	bh=xLtsaslWm2dxU5T6/I1I4epcQYPP0A2nUrXa9ZokVU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WmseS//4J01BcA7TajH8H1D5cHKqUNeq/qYQc78xF4vwnOjD/gb+pnWKfDYO5+1e7V9LKRtcfW4MpQYeDA/q6cqzyHrZLOdJrWHDrqZo7wzx9o6Ods0s11cx2eoDfhCOG0STHtY+M/FopBFgQniTqG9rtUot1v8ilLjm/C3HdX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fayFjeO8; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fayFjeO8"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6dd15d03eacso27364746d6.0;
        Sat, 11 Jan 2025 09:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736615594; x=1737220394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGTUxZNn6BI2C5ISIy+CjsUqwdWvV3YLsbGoys6GlzM=;
        b=fayFjeO8/iFSgwWn7QvD7YPuxkumHZvhFQooeBu1PTXY5IhwNL5HTkcFW+k58cTuST
         rmTPKzR4iZ1XLbgvHpmXNMFFebG9J5B+HG1sG1NXBBEp85ywEjsSNbbkT/8+THnBIETt
         0tF+CHiC2lBEZ/2kD2fw8n95h7i2INQE9hHb9X519arAUNX7+/8TTapjP8nuhXU3viae
         pOmYnHN2k03IL59+al03MKHhD/HyZMiPc3MMj3rpWXlRCADz0b988GkM1MjmySSGIv+/
         oP9sFqOm5DDWbiAuF3/ks6+KgFV8H+/SPEjtj1qH8WABLkYVoeXWbWqbmtvEsK4uRnU0
         dOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736615594; x=1737220394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGTUxZNn6BI2C5ISIy+CjsUqwdWvV3YLsbGoys6GlzM=;
        b=qDXskPKDtUxol7TnDHDSgK2j0Fg6AIg4ZhnnvhUPige+P746L504xoPr9FYHxV2Zdi
         r/lWXYUVQcygRyai1iQpkiM3sLI/tGTsqI19HnJ7WRVCigNfSR5wEpyHC7NeJCSps229
         bEGGS6OAUJnmauDJPjYYY7jWKUIzzTNN+ba/stEhrEb5wezXsn1y11Y5xVXPGOqaN+W7
         J1YSzdP/2PAXq/ANBXx/lveIyPGhXmwUqOeggg2W8+XYwwFpUbqWt+omW4H42Fs2DEra
         H7qtSkIvXb9hxZB4iPGUJHlj6GvrvV8MPFsLTEj0ziaBfGi7tmAG0ZTIR+Avi4obunET
         d2xQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5EjXWKN0Hp+EL/6lMJNVaw989J+htDPoF9U2FJIV0ptULjj8XItddavuArT8ZAsIy5hxUP5u3Jr2idgG8DZl//yx0WA==@vger.kernel.org, AJvYcCUJRJEvwnu0LpY2bUHM/fIKfXpwdcfkx9bTgjAmtElcUgMKPco/ThQK89xFn45/3AaqYbwR/5Jk/wY=@vger.kernel.org, AJvYcCWwUfX6Rorl+nq/2O6YGqGmwxuqcl4tkHRbIc9YDWAh18L6qFNos+MgPKksKtVxZTWHcDLY6YfjMKCvfIBF@vger.kernel.org
X-Gm-Message-State: AOJu0YwNblbyoL7t/q6v4WghpwWx+QHmbTTZV+XxHK4W/zOHNP1anQUR
	rOmYs0fqGmg+JkjdS/LKBEbANnliK9st5c9kzWnRwnGgd4piPaKaFYuRHft8Vo9c+pD1KCNY5Ay
	CWts0n33W1RhxW8wou08TDSfbJzE=
X-Gm-Gg: ASbGnctKWSTcaLFy1NR8VbHxFqeReiyQcXwkcMY/GNDubLXoW1ZQU3fHfGar2VtMZjU
	3ijUv0GpjPzn9OQRKhEGwZdazit4em+/Y21C08aU=
X-Google-Smtp-Source: AGHT+IFxsXwqOYxLtrZDrtfA0UWN8OXpzghMyOAzRpXbwfiQKT54+bslaxqyqZA3xlNkYAK/O+13HQseJAQ55R1rmG0=
X-Received: by 2002:a05:6214:2f88:b0:6d8:b5dd:7699 with SMTP id
 6a1803df08f44-6dfbaa188fdmr37751306d6.17.1736615594026; Sat, 11 Jan 2025
 09:13:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
 <dc5375fb-1e2e-42b9-9174-3f4a70d914e7@kernel.org> <CAFqHKTkRhaci86qBE4Zc+EeV47T22y8fuesjWN_3WzFTuEnOPg@mail.gmail.com>
 <c29e64fd-8e9c-4179-806e-db516576a153@gmx.de> <CAFqHKTmJKdZV2unLAZjRGSdjE5mB7H5ONuF2wfC9dnuFJ0R16g@mail.gmail.com>
 <fd250291-4102-4dcd-8448-d878c3a013bf@gmx.de>
In-Reply-To: <fd250291-4102-4dcd-8448-d878c3a013bf@gmx.de>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Sat, 11 Jan 2025 09:13:02 -0800
X-Gm-Features: AbW1kvZnh0e3C65TU4TtMgQSj_sp65M0nkcjqq8qY9PsLoC2Uon9MWYlw4KwFXw
Message-ID: <CAFqHKTnMAcbtgkD-KncO0H-qvXfnBLwdnhSoH+rM_LCV85H_WA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] platform/x86: Add Lenovo Gaming Series WMI Drivers
To: Armin Wolf <W_Armin@gmx.de>
Cc: Mario Limonciello <superm1@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>, 
	Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, "Cody T . -H . Chiu" <codyit@gmail.com>, 
	John Martens <johnfanv2@gmail.com>, platform-driver-x86@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 4:25=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
> >> I attached a prototype WMI driver for another device which had a simil=
ar problem.
> >> The solution was to provide a notifier so other event consumers can be=
 notified
> >> when an WMI event was received.
> >>
> >> Example event consumer callback code:
> >>
> >>          static int uniwill_wmi_notify_call(struct notifier_block *nb,=
 unsigned long action, void *data)
> >>          {
> >>                  if (action !=3D UNIWILL_OSD_PERF_MODE_CHANGED)
> >>                          return NOTIFY_DONE;
> >>
> >>                  platform_profile_cycle();
> >>
> >>                  return NOTIFY_OK;
> >>          }
> >>
> >> I would also suggest that you use a notifier for communicating with th=
e gamezone
> >> interface. Then you just have to submit commands (as action values) in=
 the form of events
> >> which will then be processed by the available gamezone drivers (the re=
sult can be stored in *data).
> >>
> >> Those gamezone drivers can then return NOTIFY_STOP which will ensure t=
hat only a single gamezone
> >> driver can successfully process a given command.
> >>
> >> All in all the patch series seems to progress nicely. I am confident t=
hat we will solve the remaining issues.
> >>
> >> Thanks,
> >> Armin Wolf
> >>
> > That's a novel approach. There are some EVENT GUID's for the gamezone
> > interface I'll need to incorporate to keep everything in sync. These
> > devices have physical buttons (Fn+Q on laptops, Legion +Y button on
> > handhelds) to cycle the profiles. I didn't add this previously because
> > we were always updating it when called. I presume that each GUID will
> > need a separate driver for this. Any advice or examples on how to use
> > this to update the pprof in GameZone would be appreciated as I've
> > never used .notify before.
>
> The WMI driver inside the attachment should be a suitable starting point.
> You can also reuse the same driver for many different GUIDs and do the fo=
llowing:
>
> - use the context inside the wmi_device_id to find out which GUID is bein=
g probed.
> You can use drivers/platform/x86/xiaomi-wmi.c as an example.
>
> - inside the .notify callback parse the event data and the call the notif=
ier.
> You can use the action parameter to signal which kind of WMI event was re=
ceived (SMART_FAN_MODE_EVENT, ...)
> and the data parameter to pass the event data.
>
> With this you only need to provide a single WMI driver.
>
> The lenovo-wmi-gamezone driver can then register with this notifier and l=
isten for
> platform profile changes:
>
>         static int lenovo_gz_notify_call(struct notifier_block *nb, unsig=
ned long action, void *data)
>          {
>                  if (action !=3D SMART_FAN_MODE_EVENT)    // Filter event=
s
>                          return NOTIFY_DONE;
>
>                 <check *data if necessary>
>
>                  platform_profile_cycle();      // Cycle platform profile=
 if necessary
>
>                  return NOTIFY_OK;
>          }
>

Makes sense, I'll get to work on it and if I have more questions I'll
reach out again.

Thanks Armin,
Derek

> >
> > My expected information flow will be these paths:
> > Physical Button press -> WMI event GUID notifier driver -> Gamezone
> > driver update & notify_call -> Other Mode save data to priv for lookup
> > when current_value is checked and return STOP .
> > or
> > platform-profile class write from sysfs -> Gamezone driver update &
> > notify_call ->Other Mode save data to priv for lookup when
> > current_value is checked and return STOP .
> >
> > Thanks,
> > Derek
>
> Your approach would have a problem: how to communicate the initial platfo=
rm profile state
> when lenovo-wmi-other probes?
>
> I suggest that lenovo-wmi-gamezone stores the current platform profile. T=
his value can then
> be retrieved by lenovo-wmi-other by using the special gamezone notifier. =
This would also allow
> lenovo-wmi-other to detect when lenovo-wmi-gamezone is not ready and can =
thus not provide
> platform profile data.
>
> Thanks,
> Armin Wolf
>
