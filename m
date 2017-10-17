From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v9 01/17] platform/x86: wmi: Add new method
 wmidev_evaluate_method
Date: Tue, 17 Oct 2017 20:41:17 +0200
Message-ID: <20171017184117.cf54lontusaovidg@pali>
References: <cover.1508259916.git.mario.limonciello@dell.com>
 <3ee262c740c8ab1fb6adb9c79050c6aefb75596c.1508259916.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3ee262c740c8ab1fb6adb9c79050c6aefb75596c.1508259916.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>
List-Id: platform-driver-x86.vger.kernel.org

On Tuesday 17 October 2017 13:21:45 Mario Limonciello wrote:
> Drivers properly using the wmibus can pass their wmi_device
> pointer rather than the GUID back to the WMI bus to evaluate
> the proper methods.
> 
> Any "new" drivers added that use the WMI bus should use this
> rather than the old wmi_evaluate_method that would take the
> GUID.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> Reviewed-by: Edward O'Callaghan <quasisec@google.com>

Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

-- 
Pali Rohár
pali.rohar@gmail.com
