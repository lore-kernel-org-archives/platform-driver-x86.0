From: =?utf-8?B?QWxlxaEgS2FwaWNh?= <kapica@fel.cvut.cz>
Subject: Problem with a notebook keyboard after plug into dock station
Date: Thu, 30 Nov 2017 12:09:15 +0100
Message-ID: <op.zaijxpd8dqmfw5@localhost>
Reply-To: kapica@fel.cvut.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

After the last  dist upgrade my system (I use Debian unstable amd64), was encountered a problem, that begined from the kernel 4.13 and probably concerns the wmi module. Kernel version 4.12 and lower is ok.

I have a HP ProBook 6475b notebook. When I plug-in it in the 'HP 230W Advanced Docking Station', the keyboard will stop working in the X server environment.

Accepted only a code keys from external USB keyboard. But on the text console  works the notebook keyboard seamlessly too.

acpi_listen:
…
95F24279-4D7B-43 00000080 00000000
video/tabletmode TBLT 0000008A 00000001
ac_adapter ACPI0003:00 00000080 00000001
…

When unplug notebook from dock station, it work again normal.

I don't know if is the bug or feature, but it is very uncomfortable because external keyboard occupied place on my table.

If it should be feature, please advise mee how to turn it off.

Thank you,

Aleš Kapica

-- 
Using Opera's revolutionary e-mail client: http://www.opera.com/mail/
