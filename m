From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v4 4/6] platform/x86: huawei-wmi: Add battery charging
 thresholds
Date: Mon, 23 Sep 2019 14:06:43 +0800
Message-ID: <20190923060643.GE15734@shao2-debian>
References: <20190920160250.12510-5-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190920160250.12510-5-ayman.bagabas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Sinan Kaya <okaya@kernel.org>, Takashi Iwai <tiwai@suse.de>, Ayman Bagabas <ayman.bagabas@gmail.com>, Stuart Hayes <stuart.w.hayes@gmail.com>, Matan Ziv-Av <matan@svgalib.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Hans de Goede <hdegoede@redhat.com>, Peng Hao <peng.hao2@zte.com.cn>, Krzysztof Kozlowski <krzk@kernel.org>, Mattias Jacobsson <2pi@mok.nu>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Ayman,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20190918]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Ayman-Bagabas/platform-x86-Huawei-WMI-laptop-extras-driver/20190921-072831
base:   next-20190918
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

smatch warnings:
drivers/platform/x86/huawei-wmi.c:327 huawei_wmi_battery_get() error: buffer overflow 'ret' 256 <= 256

# https://github.com/0day-ci/linux/commit/2b04f79aef9a86ecb9483dd27a82498fa56bc0c9
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 2b04f79aef9a86ecb9483dd27a82498fa56bc0c9
vim +/ret +327 drivers/platform/x86/huawei-wmi.c

2b04f79aef9a86 Ayman Bagabas 2019-09-20  311  
2b04f79aef9a86 Ayman Bagabas 2019-09-20  312  static int huawei_wmi_battery_get(int *start, int *end)
2b04f79aef9a86 Ayman Bagabas 2019-09-20  313  {
2b04f79aef9a86 Ayman Bagabas 2019-09-20  314  	u8 ret[0x100];
2b04f79aef9a86 Ayman Bagabas 2019-09-20  315  	int err, i;
2b04f79aef9a86 Ayman Bagabas 2019-09-20  316  
2b04f79aef9a86 Ayman Bagabas 2019-09-20  317  	err = huawei_wmi_cmd(BATTERY_THRESH_GET, ret, 0x100);
2b04f79aef9a86 Ayman Bagabas 2019-09-20  318  	if (err)
2b04f79aef9a86 Ayman Bagabas 2019-09-20  319  		return err;
2b04f79aef9a86 Ayman Bagabas 2019-09-20  320  
2b04f79aef9a86 Ayman Bagabas 2019-09-20  321  	/* Find the last two non-zero values. Return status is ignored. */
2b04f79aef9a86 Ayman Bagabas 2019-09-20  322  	i = 0x100;
2b04f79aef9a86 Ayman Bagabas 2019-09-20  323  	do {
2b04f79aef9a86 Ayman Bagabas 2019-09-20  324  		if (start)
2b04f79aef9a86 Ayman Bagabas 2019-09-20  325  			*start = ret[i-1];
2b04f79aef9a86 Ayman Bagabas 2019-09-20  326  		if (end)
2b04f79aef9a86 Ayman Bagabas 2019-09-20 @327  			*end = ret[i];
2b04f79aef9a86 Ayman Bagabas 2019-09-20  328  	} while (i > 2 && !ret[i--]);
2b04f79aef9a86 Ayman Bagabas 2019-09-20  329  
2b04f79aef9a86 Ayman Bagabas 2019-09-20  330  	return 0;
2b04f79aef9a86 Ayman Bagabas 2019-09-20  331  }
2b04f79aef9a86 Ayman Bagabas 2019-09-20  332  

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
