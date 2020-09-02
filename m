From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: sysfs output without newlines
Date: Wed, 2 Sep 2020 10:57:36 +0300
Message-ID: <CAHp75VekCuRCxg_J1V4Rsfq6LEfkH+EC8WEhFzteGpuR51WpCQ@mail.gmail.com>
References: <0f837bfb394ac632241eaac3e349b2ba806bce09.camel@perches.com>
 <4cd6275c-6e95-3aeb-9924-141f62e00449@linux.com>
 <b64a4cb0ee68fee01973616e5ef0f299ac191f6d.camel@perches.com>
 <5f0b48e0291b4b54bc1caeb8b5715c65@AcuMS.aculab.com>
 <20200901172230.531decf6@suzdal.zaitcev.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
In-Reply-To: <20200901172230.531decf6@suzdal.zaitcev.lan>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: Pete Zaitcev <zaitcev@redhat.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, =?UTF-8?Q?Kai_M=C3=A4kisara?= <Kai.Makisara@kolumbus.fi>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>, Maxim Levitsky <maximlevitsky@gmail.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, Madalin Bucur <madalin.bucur@nxp.com>, Michal Simek <michal.simek@xilinx.com>, Alex Dewar <alex.dewar90@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jakub Kicinski <kuba@kernel.org>, Tomas Winkler <tomas.winkler@intel.com>, Arnd Bergmann <arnd@arndb.de>, "platform-driver-x86@vger.kernel.org" <platform>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 2, 2020 at 1:24 AM Pete Zaitcev <zaitcev@redhat.com> wrote:
>
> On Tue, 1 Sep 2020 09:07:42 +0000
> David Laight <David.Laight@ACULAB.COM> wrote:
>
> > The shell will remove trailing '\n' (but not '\r') from:
> >       foo=$(cat bar)
> > So shell scripts are unlikely to be affected.
>
> Surprisingly enough, Python is okay with this:
>
>     with open("/proc/sys/net/ipv4/ip_forward",'r') as fp:
>         print(int(fp.read()))
>
> Nonetheless, I would rather no add those newlines. I saw enough
> weird software that is sensitive where it's should not bee.

There are still a lot of scripts in PHP and Perl. Besides that I think
the many users of such files are in clouds, means Go should be checked
even before these.

-- 
With Best Regards,
Andy Shevchenko
