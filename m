From: Jan Hinnerk Stosch <janhinnerk.stosch@gmail.com>
Subject: Re: Wireless key on Fujitsu E753 not working since a57f7f9175b8ccbc9df83ac13860488913115de4
Date: Tue, 13 Aug 2013 10:27:53 +0200
Message-ID: <CAO_aot5117jj+sGCR2UXt2_kqH-j5VxcdQbuTrGMRewDVwPbiQ@mail.gmail.com>
References: <CAO_aot5FJb1v6-CztDeuAPS7=-byULP-tMzF_DZhw6aG4A+vVw@mail.gmail.com>
	<CAO_aot4Ye=YwSvi6P2Nn=3r4N8OY03mPxXLj+mTd_ziRxb5LXA@mail.gmail.com>
	<20130812144212.GA20923@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qe0-f46.google.com ([209.85.128.46]:64465 "EHLO
	mail-qe0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752591Ab3HMI1y (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 13 Aug 2013 04:27:54 -0400
Received: by mail-qe0-f46.google.com with SMTP id i11so4166777qej.33
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Aug 2013 01:27:53 -0700 (PDT)
In-Reply-To: <20130812144212.GA20923@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: platform-driver-x86@vger.kernel.org

2013/8/12 Jonathan Woithe <jwoithe@just42.net>:
>> 2013/6/28 Jan Hinnerk Stosch <janhinnerk.stosch@gmail.com>:
>> > since commit "a57f7f9175b8ccbc9df83ac13860488913115de4" (bisected) the
>> > wireless key on my Fujitsu E753 is not working any more. If I boot up
>> > with parameter "acpi_osi="!Windows 2012"" it works, though.
>> > I filed an ACPI-bug
>> > (https://bugzilla.kernel.org/show_bug.cgi?id=60161), but was told
>> > (https://bugzilla.kernel.org/show_bug.cgi?id=60161#c5) that this is
>> > caused by the fujitsu_laptop driver. So I report it here. Should I
>> > file a bug anywhere or is it enough to write it to the list?
>
> Does this "wireless key" do what you expect if the fujitsu_laptop module is
> not loaded?
>
> I know nothing about the E753.  Is the "wireless key" a dedicated key on the
> keyboard, a separate switch, or something entirely different?  It sounds
> like it's just an enable switch.
>
> jonathan

No, the key also does not work without fujitsu_laptop module.

The key is one of two special keys - one for ECO mode (which I have
not tested or used at all) and the wireless key which switches of all
wireless functions (WLAN and bluetooth). They are not part of the
"main" keyboard. According to the output of "rfkill list" it works
indeed as a hardware switch (Hard blocked: yes/no).
