From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 08/15] samsung-laptop: add battery life extender support
Date: Wed, 23 Nov 2011 17:54:55 +0100
Message-ID: <CAHR064jzbGKyHbBvO7H9tyEbamQT9-E4bpQAhJvfNiHX9JT0zg@mail.gmail.com>
References: <1321999366-23784-1-git-send-email-corentincj@iksaif.net>
	<1321999366-23784-9-git-send-email-corentincj@iksaif.net>
	<CANq1E4TPKrig6SUT6OWXFoi=K_Q+3KNd6eZD693zfoJSWGNmGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CANq1E4TPKrig6SUT6OWXFoi=K_Q+3KNd6eZD693zfoJSWGNmGg@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: David Herrmann <dh.herrmann@googlemail.com>
Cc: platform-driver-x86@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Randy Dunlap <rdunlap@xenotime.net>, Matthew Garrett <mjg@redhat.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> My BIOS provides this option, too. However, this driver does not
> detect it on my machine. During initialization I get:
> samsung_laptop: SABI command 0x0078 failed with completion flag 0xaa
>
> Maybe you can help debugging this. If there is something I can test
> via debugfs, just tell me.

Could you try to load the module with debug=1, type these commands

$ cd /sys/kernel/debug/
$ echo 0x65 > command
$ for i in d0 d1 d2 d3; echo 0 > $i; done
$ echo 0x80 > d0
$ cat call

and then show me the output of dmesg ?

Thanks,
-- 
Corentin Chary
http://xf.iksaif.net
