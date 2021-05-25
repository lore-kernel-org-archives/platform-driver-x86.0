Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA80C2B9F8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 May 2021 15:14:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17B0961249
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 May 2021 15:14:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbhEYPQC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 May 2021 11:16:02 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.3]:38488 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229610AbhEYPQB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 May 2021 11:16:01 -0400
Received: from [100.112.131.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-a.us-west-2.aws.symcld.net id 93/5A-28848-7541DA06; Tue, 25 May 2021 15:14:31 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnleJIrShJLcpLzFFi42JJl3vFphsusjb
  BoHELo8XLCYcZLbq75zJZvDk+ncnic8dkFovVe14wWyz6+ITNgc1j0swZzB47Z91l95h3MtDj
  /b6rbB6fN8kFsEaxZuYl5VcksGac+bCHreBAUsWUiYtYGxj/OXYxcnEICfxnlNg+exEThPOYU
  WLr3T0sXYycHMICRRIfb5xl7WJk5xAR0JfYXwZSwixwlVHi/uxXjBD15xgl3s3dwwxSzyagLb
  Flyy82EJtXwFZi64tlQEM5OFgEVCUe9PiChEUFwiV2d7xkgigRlDg58wnYKk6BQIl7c/6BlTM
  LaEqs36UPEmYWEJe49WQ+E4QtL7H97RxmkBIJAUWJid90QcISAgkSPf8esU1gFJyFZOgshEGz
  kAyahWTQAkaWVYwWSUWZ6RkluYmZObqGBga6hoZGuobGhrpGhmZ6iVW6iXqlxbrlqcUlukZ6i
  eXFesWVuck5KXp5qSWbGIHxk1LQfGMH46w3H/QOMUpyMCmJ8kr5r04Q4kvKT6nMSCzOiC8qzU
  ktPsQow8GhJMFrLbw2QUiwKDU9tSItMwcYyzBpCQ4eJRHea0JAad7igsTc4sx0iNQpRkUpcd5
  TIAkBkERGaR5cGyx9XGKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzHsFZDtPZl4J3PRXQIuZ
  gBYn5awCWVySiJCSamAK5O08r3T4Uq/Y+6875kfylh7+E6AazjJbznvTz/sqDgv8pT3n/Xy9N
  MSNQWLy3x8OrMvSJ0d8rZa86cTcsXqq8lLLzUrGzYFuYZ7S7cK9Z4uSknusrp/1MLolEhwz/z
  Sb5vWfLn45T6s0T7G2n8qLfXilwzyof/J9tfc6WUmNxeZFbsfCuvkPvllubbCy386u+13nPOs
  7ooIbNixbyXhMU0v/TLwTT3nDyi+72k8FGT/32x7yPsrh8JHfFXfv19+W+HNF/PrhFOmpb/tu
  N1yefuiW5KOt/114fgiHFgi6fH/R2nFD4fd2q86DX8+/PiRuOuNVzXoPFc4p4mb+n15aWR9+J
  iHNGXr317EXO98osRRnJBpqMRcVJwIAVgTU4poDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-20.tower-336.messagelabs.com!1621955669!9847!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27574 invoked from network); 25 May 2021 15:14:30 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-20.tower-336.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 25 May 2021 15:14:30 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 784DDE9D5615A14A1319;
        Tue, 25 May 2021 23:14:27 +0800 (CST)
Received: from [10.46.192.114] (10.46.192.114) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Tue, 25 May
 2021 11:14:22 -0400
Subject: Re: [External] Re: [PATCH v2 3/3] platform/x86: think-lmi: Add WMI
 interface support on Lenovo platforms
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Prasanth KSR <prasanth.ksr@dell.com>
References: <markpearson@lenovo.com>
 <20210509015708.112766-1-markpearson@lenovo.com>
 <20210509015708.112766-3-markpearson@lenovo.com>
 <CAHp75VfM=Vv2pe=KNYQO_hf_8Ya-m8QH481xnu+OPoZL-p8TSA@mail.gmail.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <f13956b5-511e-1793-c089-6f72628ea7a8@lenovo.com>
Date:   Tue, 25 May 2021 11:14:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VfM=Vv2pe=KNYQO_hf_8Ya-m8QH481xnu+OPoZL-p8TSA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.192.114]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andy,

Many thanks for the review

On 2021-05-22 7:04 a.m., Andy Shevchenko wrote:
> On Sun, May 9, 2021 at 5:02 AM Mark Pearson <markpearson@lenovo.com> wrote:
>>
>> For Lenovo platforms that support a WMI interface to the BIOS add
>> support, using the firmware-attributes class, to allow users to access
>> and modify various BIOS related settings.
> 
> Few comments below.
> 
> ...
> 
>> +/* Convert BIOS WMI error string to suitable error code */
> 
> Can it be rather the mapping structure? In that case you move string
> literals, error codes and comments to its entries.
> Here will be something like for-loop.
> 
Yes, I can do this
> ...
> 
>> +static int tlmi_extract_error(const struct acpi_buffer *output)
>> +{
>> +       const union acpi_object *obj;
>> +       int ret;
>> +
>> +       obj = output->pointer;
>> +       if (!obj || obj->type != ACPI_TYPE_STRING || !obj->string.pointer) {
> 
> I would split !obj check, but I don't know if it is even a useful
> check. Can it be the case?
I wasn't certain on if obj could ever be null, I suspect not but as I
wasn't 100% sure I put the check in just in case.
> 
>> +               kfree(obj);
> 
> Basically you double check for NULL (see above)
> 
> Same for other similar places in the code.
> 
OK - understood. Thanks.

>> +               return -EIO;
>> +       }
>> +
>> +       ret = tlmi_errstr_to_err(obj->string.pointer);
>> +       kfree(obj);
>> +       return ret;
> 
> What I really do not like here is that you are freeing something out
> of the scope. Please, free it where it was acquired.
Ack
> 
>> +}
> 
> ...
> 
>> +       /*
>> +        * duplicated call required to match bios workaround for behavior
>> +        * seen when WMI accessed via scripting on other OS
> 
> /*
>  * Multi-line comments
>  * should have this kind of
>  * style. Pay attention to the details.
>  */
Ack (and I'm assuming here the concern is the 'D' and missing '.', let
me know if there's anything else that is important)

> 
>> +        */
> 
> ...
> 
>> +       *string = kstrdup(obj->string.pointer, GFP_KERNEL);
>> +       kfree(obj);
>> +       return *string ? 0 : -ENOMEM;
> 
> This breaks the principle "don't touch the output in error case".

But I'm not changing *string in an error case here - I'm not
understanding the issue here.
Happy to rewrite it to make it clearer though if that would help.

> 
> ...
> 
>> +       if (setting->valid)
>> +               return sysfs_emit(buf, "1\n");
>> +       else
>> +               return sysfs_emit(buf, "0\n");
> 
> sysfs_emit(buf, "%d\n", !!setting->valid);
> ?
Yeah - this was picked up on in an earlier review. Apologies.
> 
> ...
> 
>> +static ssize_t current_password_store(struct kobject *kobj,
>> +                                     struct kobj_attribute *attr,
>> +                                     const char *buf, size_t count)
>> +{
>> +       struct tlmi_pwd_setting *setting = container_of(kobj, struct tlmi_pwd_setting, kobj);
>> +       int length;
> 
>> +       length = strlen(buf);
>> +       if (buf[length-1] == '\n')
>> +               length--;
> 
> This will prevent you from using \n in the password. Why?
The BIOS doesn't like it - so we strip it out :)

> 
>> +       if (length >= TLMI_PWD_MAXLEN)
>> +               return -EINVAL;
> 
> I guess password *string* length is wrong per se. count seems the
> proper one which one should use.
Yes, this is being cleaned up after review from Hans.

> 
>> +
>> +       memcpy(setting->password, buf, length);
> 
>> +       setting->password[length] = '\0';
> 
> Why is the password a *string*? From where that assumption comes from?
Sorry, I'm not understanding the question here. It's what our BIOS is
expecting. I'm missing something here
> 
>> +       return count;
>> +}
>> +
>> +static struct kobj_attribute auth_current_password = __ATTR_WO(current_password);
> 
> ...
> 
>> +       p = strchr(new_pwd, '\n');
>> +       if (p)
>> +               *p = '\0';
> 
> strtrim(). But see above.
ack.
> 
>> +       if (strlen(new_pwd) > setting->maxlen) {
>> +               ret = -EINVAL;
>> +               goto out;
>> +       }
> 
> ...
> 
>> +       /* Format: 'PasswordType,CurrentPw,NewPw,Encoding,KbdLang;' */
>> +       len = strlen(setting->password) + strlen(encoding_options[setting->encoding])
>> +               + strlen(setting->kbdlang) + 3 /* type */
>> +               + strlen(new_pwd) + 6 /* punctuation and terminator*/;
>> +       auth_str = kzalloc(len, GFP_KERNEL);
>> +       snprintf(auth_str, len, "%s,%s,%s,%s,%s;",
>> +                setting->pwd_type, setting->password, new_pwd,
>> +                encoding_options[setting->encoding], setting->kbdlang);
> 
> NIH of kasprintf()
Not sure what NIH is - but I'm assuming I should be using kasprintf
instead of snprinf :)
I wasn't aware of it - thank you.
> 
> ...
> 
>> +       return ret ? ret : count;
> 
>       return ret ?: count;
> 
> is shorter.
Ack
> 
> ...
> 
>> +       if (strcmp(kobj->name, "Admin") == 0)
>> +               return sprintf(buf, "bios-admin\n");
>> +       else if (strcmp(kobj->name, "System") == 0)
> 
> Redundant 'else'
Ack
> 
>> +               return sprintf(buf, "power-on\n");
>> +       return -EIO;
> 
> ...
> 
>> +static struct attribute *auth_attrs[] = {
>> +       &auth_is_pass_set.attr,
>> +       &auth_min_pass_length.attr,
>> +       &auth_max_pass_length.attr,
>> +       &auth_current_password.attr,
>> +       &auth_new_password.attr,
>> +       &auth_role.attr,
>> +       &auth_mechanism.attr,
>> +       &auth_encoding.attr,
>> +       &auth_kbdlang.attr,
>> +       NULL,
> 
> The terminator line doesn't need a comma.
Argh. I always get this wrong as to when it is required and when it isn't.
I'll fix
> 
>> +};
> 
> ...
> 
>> +       new_setting = kstrdup(buf, GFP_KERNEL);
> 
> strtrim(buf) ?
ack
> 
>> +       if (!new_setting)
>> +               return -ENOMEM;
> 
>> +       p = strchr(new_setting, '\n');
>> +       if (p)
>> +               *p = '\0';
> 
> See above.
Thanks
> 
>> +       alloc_len = strlen(setting->display_name) + 3 + strlen(new_setting);
>> +
>> +       if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password) {
>> +               auth_len += strlen(tlmi_priv.pwd_admin->password) + 1
>> +                       + strlen(encoding_options[tlmi_priv.pwd_admin->encoding]) + 1
>> +                       + strlen(tlmi_priv.pwd_admin->kbdlang) + 1 + 1;
>> +               auth_str = kmalloc(auth_len, GFP_KERNEL);
>> +               if (!auth_str) {
>> +                       ret = -ENOMEM;
>> +                       goto out;
>> +               }
>> +
>> +               sprintf(auth_str, "%s,%s,%s;",
>> +                               tlmi_priv.pwd_admin->password,
>> +                               encoding_options[tlmi_priv.pwd_admin->encoding],
>> +                               tlmi_priv.pwd_admin->kbdlang);
>> +               alloc_len += auth_len;
> 
> HIN of kasprintf()
ack
> 
>> +       }
>> +
>> +       set_str = kmalloc(alloc_len, GFP_KERNEL);
>> +       if (!set_str) {
>> +               ret = -ENOMEM;
>> +               goto out;
>> +       }
>> +
>> +       str_ix += sprintf(set_str, "%s,%s", setting->display_name, new_setting);
> 
> Ditto,
ack
> 
>> +       if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password)
>> +               sprintf(set_str + str_ix, ",%s", auth_str);
>> +       else
>> +               sprintf(set_str + str_ix, ";");
>> +
>> +       ret = tlmi_simple_call(LENOVO_SET_BIOS_SETTINGS_GUID, set_str);
>> +       if (ret)
>> +               goto out;
>> +
>> +       if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password)
>> +               ret = tlmi_save_bios_settings(auth_str);
>> +       else
>> +               ret = tlmi_save_bios_settings("");
> 
>> +       if (ret)
>> +               goto out;
> 
> Useless.
Ack (and oops)
> 
>> +out:
>> +       kfree(auth_str);
>> +       kfree(set_str);
>> +       kfree(new_setting);
>> +       return ret ? ret : count;
> 
> Can be shorter.
Ack
> 
>> +}
> 
>> +static struct kobj_attribute attr_displ_name =
>> +               __ATTR_RO(display_name);
> 
> One line (and so on for all of them).
Ack
> 
> ...
> 
>> +static struct attribute *tlmi_attrs[] = {
>> +       &attr_displ_name.attr,
>> +       &attr_current_val.attr,
>> +       &attr_possible_values.attr,
>> +       NULL,
> 
> No comma.
Ack
> 
>> +};
> 
> ...
> 
>> +       struct kobj_attribute *kattr;
> 
>> +       ssize_t ret = -EIO;
> 
> Useless. Use direct return.
Ack
> 
>> +
>> +       kattr = container_of(attr, struct kobj_attribute, attr);
>> +       if (kattr->show)
>> +               ret = kattr->show(kobj, kattr, buf);
>> +       return ret;
> 
> ...
> 
>> +       struct kobj_attribute *kattr;
>> +       ssize_t ret = -EIO;
>> +
>> +       kattr = container_of(attr, struct kobj_attribute, attr);
>> +       if (kattr->store)
>> +               ret = kattr->store(kobj, kattr, buf, count);
>> +       return ret;
> 
> As above.
Ack
> 
> ...
> 
>> +       for (i = 0; i < TLMI_SETTINGS_COUNT; i++) {
>> +               /*Check if index is a valid setting - skip if it isn't */
> 
> Missed space.
Ack
> 
>> +               if (!tlmi_priv.setting[i])
>> +                       continue;
>> +
>> +               /* build attribute */
>> +               tlmi_priv.setting[i]->kobj.kset = tlmi_priv.attribute_kset;
>> +               ret = kobject_init_and_add(&tlmi_priv.setting[i]->kobj, &attr_name_ktype,
>> +                               NULL, "%s", tlmi_priv.setting[i]->display_name);
>> +               if (ret)
>> +                       goto fail_create_attr;
>> +
>> +               ret = sysfs_create_group(&tlmi_priv.setting[i]->kobj, &tlmi_attr_group);
>> +               if (ret)
>> +                       goto fail_create_attr;
>> +       }
> 
> ...
> 
>> +       int i = 0;
> 
> Why assignment?
Left over from earlier iteration. Should be removed.

> 
>> +       for (i = 0; i < TLMI_SETTINGS_COUNT; ++i) {
>> +               char *item = NULL;
>> +               int spleng = 0;
>> +               int num = 0;
>> +               char *p;
>> +               struct tlmi_attr_setting *setting;
>> +
>> +               tlmi_priv.setting[i] = NULL;
>> +               status = tlmi_setting(i, &item, LENOVO_BIOS_SETTING_GUID);
>> +               if (ACPI_FAILURE(status))
>> +                       break;
>> +               if (!item)
>> +                       break;
>> +               if (!*item)
>> +                       continue;
>> +
>> +               /* It is not allowed to have '/' for file name. Convert it into '\'. */
>> +               spleng = strlen(item);
>> +               for (num = 0; num < spleng; num++) {
>> +                       if (item[num] == '/')
>> +                               item[num] = '\\';
>> +               }
> 
> NIH of strreplace(), but please check its name.
Will do. Thanks!

> 
>> +
>> +               /* Remove the value part */
>> +               p = strchr(item, ',');
>> +               if (p)
>> +                       *p = '\0';
>> +
>> +               /* Create a setting entry */
>> +               setting = kzalloc(sizeof(struct tlmi_attr_setting), GFP_KERNEL);
>> +               if (!setting) {
>> +                       ret = -ENOMEM;
>> +                       goto fail_clear_attr;
>> +               }
>> +               setting->index = i;
>> +               strscpy(setting->display_name, item, TLMI_SETTINGS_MAXLEN);
>> +               /* If BIOS selections supported, load those */
>> +               if (tlmi_priv.can_get_bios_selections) {
>> +                       ret = tlmi_get_bios_selections(setting->display_name,
>> +                                       &setting->possible_values);
>> +                       if (ret || !setting->possible_values)
>> +                               pr_info("Error retrieving possible values for %d : %s\n",
>> +                                               i, setting->display_name);
>> +               }
>> +               tlmi_priv.setting[i] = setting;
>> +               tlmi_priv.settings_count++;
>> +               kfree(item);
>> +       }
> 
> I stopped here because it's full of such small issues.
Ouch.
Many thanks for the review. I'll go through the rest and see if I can
clean it up more to make it less painful.
> 
> Basically the summary
>  - try to find the existing APIs for routines that quite often in use
> (usually string operations)
>  - try to make your code compact with the same level of readability
> 
> 
I really had tried to do that - many thanks for your patience and review
details.

Mark
