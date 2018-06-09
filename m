From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: ThinkPad T480s & thinkpad_acpi.ko
Date: Sat, 9 Jun 2018 00:03:55 -0300
Message-ID: <20180609030354.n7gcoain34lde73i@khazad-dum.debian.net>
References: <20180608081204.ztv4yb62szuyfsz6@pali>
 <CAHp75VfFA6ghuSeAAfcbRS47A12BCcQiAmBt_N5ejm8EsP+3yA@mail.gmail.com>
 <20180608102910.24c2l43ffgwxalgq@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180608102910.24c2l43ffgwxalgq@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 08 Jun 2018, Pali Rohár wrote:
> which has only 4.9 kernel and LEN0268 identifier was added in git commit
> a3c42a467a254a17236ab817d5c7c6bc054e4f84 for 4.10.

You could always request it to be backported to -stable *if* you
manually apply it to a 4.9 kernel and test the heck out of it...

Debian would pick it up from -stable after a while.

-- 
  Henrique Holschuh
